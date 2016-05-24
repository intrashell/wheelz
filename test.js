var hello = [1,2,3,4,5,6,7,8,9,10];
var str = '(?';
for(var i = 0; i < 10; i++) {
	str += ',?';
}
str += ')';
var myHi = new Array(4).fill(str);
var sql = 'INSERT INTO table SET(a,b,c,d) VALUES'+myHi[0];
for(var i = 1; i < 4;i++) {
	sql += ','+myHi[i];
}
sql += ';';
console.log(sql);