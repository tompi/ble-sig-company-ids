# Scraper for bluetooth.com list of BLE SIG Companies

This utility downloads list of BLE SIG id's from here:
https://www.bluetooth.com/specifications/assigned-numbers/company-identifiers
parses it, and generate csv and json files with the content in the output folder.

Run "npm install" first, then run the "get\_company\_ids.sh" and you should get an up to date list in the output folder, providing you are on a unix system with node and wget installed.
