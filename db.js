var mysql = require('mysql');

var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '', /*본인 db 비밀번호 입력하세요*/
    database: 'CloudCotent'
});
db.connect();

module.exports = db;