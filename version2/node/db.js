var mysql = require('mysql');

var db = mysql.createConnection({
    host: 'localhost',
    user: '', /*본인 db user 입력하세요*/
    password: '', /*본인 db 비밀번호 입력하세요*/
    database: 'CloudContent'
});
db.connect();

module.exports = db;