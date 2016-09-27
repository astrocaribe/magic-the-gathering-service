'use strict';

var logging     = require('./helpers/logging');
var error       = require('./helpers/error');
var logic       = require('./logic');
var serviceInfo = require('./package.json');

// GET /ping route handler
module.exports.pingHandler = function pingHandler(req, res){
    logging.logExceptOnTest('[INFO]: ' + req.method + ' ' + req.url + ' starting.');

    var jsonResponse = {};
    jsonResponse.name = serviceInfo.name;
    jsonResponse.version = serviceInfo.version;
    jsonResponse.description = serviceInfo.description;

    res.send(jsonResponse);
    logging.logExceptOnTest('[INFO]: ' + req.method + ' ' + req.url + ' finished.');
};

// GET /cards route handler
module.exports.getCardsHandler = function getCardsHandler(req, res){
  logging.logExceptOnTest('[INFO]: ' + req.method + ' ' + req.url + ' starting.');

  logic.getCardCollection(function(err, results){
    if (!err) {
      res.status(200);
      res.send(results);
    } else {
      var errorObject = error.generate(err, 'Internal Server Error.', 500, req.log);
      res.status(500);
      res.send(errorObject);
    }
  });

  logging.logExceptOnTest('[INFO]: ' + req.method + ' ' + req.url + ' finished.');
};

// Catch-all for non-provisioned 404s route handler
module.exports.noRouteHandler = function noRouteHandler(req, res) {
  var errorObject = error.generate('routeNotFoundError', req.path + ' Route not found.', 404, req.log);

  res.status(404);
  res.send(errorObject);
};
