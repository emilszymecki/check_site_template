const fs = require('fs');
const path = require('path');

async function myGoToKeyword(page) {
	const data = await page.evaluate((args) => {
		var locationherf = window.location.href;
		var title = document.title;
		// log all variables
		console.log(locationherf, title);
		return ({ "locationherf":locationherf, "title":title });
	});

      return data;


      /*
	// Create an object to store the data
	const data = {
		location: locationherf,
		title: title
	};

	// Write data to a JSON file
      const filePath = path.join(args[0], 'data.json');
	fs.writeFileSync(filePath, JSON.stringify(data));

	// Optionally, log to the console
	console.log('Data saved:', data);
      */

}
exports.__esModule = true;
exports.myGoToKeyword = myGoToKeyword;
