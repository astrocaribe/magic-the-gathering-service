/* global describe, it */

'use strict';

var expect = require('chai').expect;
var logging = require('../../../helpers/logging');

describe('logging', function(){

  describe('.logExceptOnTest', function(){
    it('should log a message when NODE_ENV is undefined', function(done){
      process.env.NODE_ENV = undefined;

      expect(logging.logExceptOnTest('Test Message')).to.equal('ok');
      done();
    });

    it('should log a message when NODE_ENV !== \'test\'', function(done){
      process.env.NODE_ENV = 'dev';

      expect(logging.logExceptOnTest('Test Message')).to.equal('ok');
      done();
    });

    it('should not log a message when NODE_ENV == \'test\'', function(done){
      process.env.NODE_ENV = 'test';

      expect(logging.logExceptOnTest('Test Message')).to.be.undefined;
      done();
    });
  });
});
