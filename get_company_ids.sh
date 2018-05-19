#!/bin/sh

# Download company ids as raw html from bluetooth.com
wget -O output/ble_raw.html 'https://www.bluetooth.com/specifications/assigned-numbers/company-identifiers';

# Parse file and get only the company id's json
grep "^ \+data: \+\[\[" output/ble_raw.html | \
	sed "s/^ \+data: \+//" | \
	sed "s/<span style='color:#000000'>//g;" | \
	sed "s/<\/span>//g;" | \
  # First transform start and end of js-array 
  # from [[...]] to {"companies": [...]}
	sed "s/\]\],.\+$/\]\]/;" | \
	sed "s/\[\[/{ \"companies\": \[\n\t\[/g;" | \
	sed "s/\]\]/\]\n\]\}/g;" | \
  # Now replace "],[" with "],\n\t[" to get one line per company
	sed "s/\],\[/\],\n\t\[/g;" > output/ble_companies.json

# Generate minimal csv output
node parse_raw_json.js > output/ble_companies.csv
