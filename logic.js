'use strict';

var db = require('./db');

// Logic for GET /cards collection
exports.getCardCollection = (page, callback) => {

  db.getCardsQuery((err, results) => {

    if(!err) {

      // For each record...
      results.forEach(function(result){
        // extract colors as an array...
        var resultColors = [result.color_1, result.color_2, result.color_3];

        // and filter null colors, then reassign as a colors object
        result.colors = resultColors.filter(function(color) {
          return color !== null;
        });

        // Remove now defunct individual colors from result
        delete result.color_1;
        delete result.color_2;
        delete result.color_3;
      });

      // Prepare jsonResponse
      var jsonResponse = {};

      if (page !== undefined) {
        // Set up start, end for paginated data, based on requested page
        var startIndex = Number(page) * 10;
        var endIndex = (Number(page) + 1) * 10;

        jsonResponse.data = results.slice(startIndex, endIndex);
        jsonResponse.page = page;
      } else {
        jsonResponse.data = results.slice(0, 10);
        jsonResponse.page = 0;
      }

      jsonResponse.totalCount = results.length;

      callback(null, jsonResponse);
    } else {
      callback(err, null);
    }

  });
};
