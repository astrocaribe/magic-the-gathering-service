'use strict';

var express      = require('express');
var parseArgs    = require('minimist');
var bunyanLogger = require('express-bunyan-logger');

var config   = require('./config/config');
var logging  = require('./helpers/logging');
var handlers = require('./handlers');

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
app.get('/ping', handlers.pingHandler);

app.get('/cards', handlers.getCardsHandler);

app.get('*', handlers.noRouteHandler);
/* *************** ROUTES *************** */


// HTTP Server
app.listen(port, function(){
  logging.logExceptOnTest('Node.js server listening on port ' + port);
});

// Export app for use as an external module
module.exports = app;
