var wDB = wDB.prototype;

/**
*	Determine which library to use.
*	@source this will be referenced to determine which library to use.
*/
function wDB(library) {
	var wDB = this;
	var errors;
	if(library == 'lite') {
		var data = require('sqlite3').verbose;
		var source = 'lite';
	} else {
		var data = require('mysql');
		var source = 'mysql';
	}
	var con;
}
wDB.connect = function(db, callback) {
	if(.source == 'lite') {
		wDB.con = new wDB.data.Database(db); 
	} else {
		callback('You are not using the correct library for this function.');
	}
}
wDB.connect = function(host, user, pass, db, callback) {
	if(wDB.source == 'mysql') {
		wDB.con = wDB.data.createConnection({
			host: host,
			user: user,
			password: pass,
			database: db
		});
	} else {
		callback('You are not using the correct library for this function.');
	}
}

// Create RUD
wDB.insert = function(table, rows, callback) {
	if(wDB.source == 'lite') {
		wDB.describeTable(function(columns) {
			var colNum = columns.length;
			var rowNum = rows.length;
			if(colNum > rowNum || rows.isArray == false) {
				callback('Rows do not match Columns');
				return
			}
			var numRows = (rowNum / colNum);
			var col = '('+columns[0];
			for(var i = 1; i < colNum; i++) {
				col += ','+columns[i];
			}
			var sql = 'INSERT INTO '+table+' SET'+col+') VALUES';
			for(var i = 0; i < numRows; i++) {
				/* Creating filler ? */
			}
			var fill = new Array(rowNum / rowCol);
			if(colNum < rowNum) {
				if(colNum < (rowNum / (rowNum / colNum))) {
					callback('Rows do not match Columns**');
					return
				}
			}
		});
	} else {

	}
}

// CRead UD
wDB.describeTable = function(table, callback) {
	if(wDB.source == 'lite') {
		wDB.con.all('pragma table_info('+table+')', function(err, rows) {
			var columns = [];
			for(var key in rows) {
				columns.push(rows[1]);
			}
			callback(columns);
		});
	} else {
		wDB.con.query('DESCRIBE '+table, function(err, rows) {
			var columns;
			for(var key in rows) {
				columns[] = rows['Field'];
			}
			callback(columns);
		});
	}
}
// CRUpdate D
// CRUDelete