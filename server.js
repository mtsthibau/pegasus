var express = require('express');
var bodyParser = require('body-parser');
var logger = require('morgan');
var app = express();

app.rootPath = __dirname;
app.db = require('./db/db');

app.use(logger('dev'));
app.use(express.static(__dirname + '/public'));
app.use(bodyParser.json());

require('fs')
    .readdirSync('./private/core')
    .filter(function (file) {
        return (file.indexOf('.') !== 0) && (file.indexOf('Api.js') > 0);
    })
    .forEach(function (file) {
        require('./private/core/' + file)(app);
    });

var port = process.env.PORT || 3030;
app.listen(port);

console.log('Listening on port ' + port + '...');
