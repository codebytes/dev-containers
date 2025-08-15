/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/

'use strict';

const express = require('express');

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
	res.send('Hello remote world!\n');
});

// New endpoint: GET /hello?name=YOUR_NAME -> "hello YOUR_NAME"
app.get('/hello', (req, res) => {
	const nameParam = req.query && typeof req.query.name === 'string' ? req.query.name.trim() : '';
	const name = nameParam.length > 0 ? nameParam : 'world';
	res.send(`hello ${name}\n`);
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);