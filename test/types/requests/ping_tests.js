/* global describe, it */

'use strict';

var expect  = require('chai').expect;
var request = require('supertest');

var app = require('../../../server');

// Set NODE_ENV to test to suppress console logs
process.env.NODE_ENV = 'test';

describe('ping route', function(){

  describe('GET /ping', function(){
    it('should return a ping message', function(done){
      request(app)
      .get('/ping')
      .end(function(err, res){
        expect(res.status).to.equal(200);
        expect(res.body).to.be.an('object');
        expect(res.body).to.include.keys('data');
        expect(res.body.data).to.equal('This service is alive!');
        done();
      });
    });
  });
});
