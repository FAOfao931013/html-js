const util = require('util');
const fs = require('fs');
const writeFile = util.promisify(fs.writeFile);
const write = util.promisify(fs.write);
const stat = util.promisify(fs.stat);

const asyncFunc = async () => {
	await writeFile('test.txt', 'hello node');
	let result = await stat('test.txt');
  	console.log(result.size);
};

asyncFunc();