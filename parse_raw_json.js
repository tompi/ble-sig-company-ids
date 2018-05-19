var fs = require("fs");
var he = require("he");
var csvstringify = require("csv-stringify");

var file = fs.readFileSync("output/ble_companies.json");
var companies = JSON.parse(file).companies;
var output = [];

// only take first value(decimal number) and third (company name)
for (i=0; i<companies.length; i++) {
	output[i] = [
			parseInt(companies[i][0], 10), 
			he.decode(companies[i][2])
	];
}

// output as csv
csvstringify(output, (err, csv) => console.log(csv));
