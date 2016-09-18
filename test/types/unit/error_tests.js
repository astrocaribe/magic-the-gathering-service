/* global describe, it */

'use strict';

var expect = require('chai').expect;
var error  = require('../../../helpers/error');

// Mock logger
var log = {};
log.error = (input) => {
  // console.log(input);
};

describe('error', function(){

  describe('.generate', function(){
    it('should create an error object', function(done){
      var err = {};

      err.name = 'teaPotError';
      err.message = 'Short and stout!';
      err.status = 418;

      var errorResult = error.generate(err.name, err.message, err.status, log);

      expect(errorResult).to.be.an('error');
      done();
    });
  });
});
