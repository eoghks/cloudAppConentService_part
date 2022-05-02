var http = require("http");
var fs = require("fs");
var db = require('./db');
var db_fun = require('./db_function');

var app = http.createServer(function (request, response) {
    var url = request.url;
    if (request.url == "/usertest") {
        db_fun.user(request, response);
    } else if (request.url == "/gettest") {
        db_fun.getpath(request, response);
    }
    else {
        response.writeHead(404);
        response.end("abc");
    }
});
app.listen(3000);