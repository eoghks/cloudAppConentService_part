var mysql = require('mysql');

var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'rla993', /*본인 db 비밀번호 입력하세요*/
    database: 'CloudContent'
});
db.connect();

module.exports = db;