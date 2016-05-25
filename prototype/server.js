// server.js

// Call modules
// =============================================================================
var express     = require('express');
var app         = express();
var bodyParser  = require('body-parser');
var mysql       = require('mysql');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var port = process.env.PORT || 10101;

// ROUTER
// =============================================================================
var router = express.Router();

router.post('/test/', function(req, res) {
	var con = mysql.createConnection({
		host: 'localhost',
		user: 'root',
		password: 'password',
		database: 'prototype'
	}, function(err) {
		if(err) throw err;
	});

    var url = req.body;
    var num = url.number;
    var msg = url.message;
    var mes = { number: num, message: msg};
    console.log('Received a new message');
    con.query('INSERT INTO tested SET ?', mes, function(err, res) {
    	if(err) throw err;

        console.log('Number:    '+num);
        console.log('Message:   '+msg);
    	console.log('Added Message number ' + res.insertId);
    });
    con.end(function(err) {
    	if(err) throw err;
    });
    res.end();
});

app.use('/', router);

// START THE SERVER
// =============================================================================
app.listen(port);
console.log('Starting Internal API ' + port);