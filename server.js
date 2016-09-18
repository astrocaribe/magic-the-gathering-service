'use strict';

var express = require('express');
var parseArgs = require('minimist');
var bunyanLogger = require('express-bunyan-logger');

var config = require('./config/config');
var error  = require('./helpers/error');
var logging = require('./helpers/logging');

// Parse cli arguments when stating server and assign to variables
// Set defaults values if not defines
var args = parseArgs(process.argv.slice(1));
var port = args.port || 4000;

// Initialize logger
var log = bunyanLogger(config.bunyan);

// Service configuration
var app = express();
app.use(log);

/* *************** ROUTES *************** */
// GET /ping
app.get('/ping', function(req, res){
  logging.logExceptOnTest('[INFO]: ' + req.method + ' ' + req.url + ' starting.');

  var jsonResponse = {};
  jsonResponse.data = 'This service is alive!';

  res.send(jsonResponse);
  logging.logExceptOnTest('[INFO]: ' + req.method + ' ' + req.url + ' finished.');
});


// Catch-all for non-provisioned 404s
app.get('*', function(req, res, done) {
  var errorObject = error.generate('routeNotFoundError', req.path + ' Route not found.', 404, req.log);

  res.status(404).send(errorObject);
});

/* *************** ROUTES *************** */


// HTTP Server
app.listen(port, function(){
  logging.logExceptOnTest('Node.js server listening on port ' + port);
});

// Export app for use as an external module
module.exports = app;
