'use strict';

var mySQL = require( 'mysql' );
var dbConfig = require( './config/config' ).db;

var dbPool = mySQL.createPool( dbConfig );

exports.getCardsQuery = function ( callback ) {
  var queryString = 'select c.id, c.name, c.mana_cost, c.converted_mana_cost, c.type, c.sub_type, c.text, c.flavor_text, c.expansion, c.power, c.toughness, c.rarity, c.quantity, c.card_number, cc.color_1, cc.color_2, cc.color_3 from cards c join card_colors cc where cc.card_id = c.id;';

  dbPool.getConnection( function ( err, connection ) {
    if ( err ) {
      callback( err, null );
    }

    connection.query( queryString, function ( err, results ) {
      if ( err ) {
        callback( err, null );
      } else {
        callback( null, results );
      }

      connection.release();
    } );
  } );
};
