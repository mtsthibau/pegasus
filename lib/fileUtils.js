"use strict";
var fs = require('fs');

var extractFileName = function (file) {
    return file.split('.')[0];
};

var extractFileExt = function (file) {
    return file.split('.').pop().toUpperCase();
};

var readDirectory = function (path, extension, forEachFn) {

    fs
        .readdirSync(path)
        .filter(function (file) {
            return (file.indexOf('.') !== 0) && (extractFileExt(file) == extension);
        })
        .forEach(forEachFn);
};

exports.extractFileName = extractFileName;
exports.extractFileExt = extractFileExt;
exports.readDirectory = readDirectory;