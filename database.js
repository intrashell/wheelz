var method = wDB.prototype
/**
*	Determine which library to use.
*	@source this will be referenced to determine which library to use.
*/
function wDB(library) {
	var wDB = this;
	var errors;
	if(library == 'lite') {
		var sqlite3 = require('sqlite3').verbose;
		var source = 'lite';
	} else {
		var data = require('mysql');
		var source = 'mysql';
	}
	var con;
}
// Connection

/**
* This method connects us to the database.
* @db
* @callback
*/
method.connect = function(db, callback) {
	if(wDB.source == 'lite') {
		wDB.con = new wDB.data.Database(db); 
	} else {
		callback('You are not using the correct library for this function.');
	}
}

/**
* This method connects us to the database.
* @host 	Host Name (I.E. localhsot, sql.mysql.come)
* @user 	User Name to connect in with.
* @pass 	Password used to connect wiht
* @db 		Name of the Database we are using.
* @callback
*/
method.connect = function(host, user, pass, db, callback) {
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
method.insert = function(table, rows, callback) {
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
			var filler = '(?,';
			for(var i = 1; i < numRows; i++) {
				filler += ',?';
			}
			filler += ')';
			var fill = new Array(rowNum / rowCol).fill(sql);
			sql += fill[0];
			if(colNum < rowNum) {
				if(colNum < (rowNum / (rowNum / colNum))) {
					callback('Rows do not match Columns**');
					return
				}
				var len = fill.length;
				for(var i = 1; i < len; i++) {
					sql += ','+fill[i];
				}
			}
			sql += ';';
			var stmt = wDB.prepare(sql);
			stmt.run(rows);
		});
	} else {

	}
}

// CRead UD
method.describeTable = function(table, callback) {
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
			var columns = [];
			for(var key in rows) {
				columns.push(rows['Field']);
			}
			callback(columns);
		});
	}
}
// CRUpdate D
// CRUDelete

method.close = function(callback) {
	wDB.con.close();
}

module.exports = wDB;