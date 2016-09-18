/* global describe, it */

'use strict';

var expect  = require('chai').expect;
var request = require('supertest');

var app = require('../../../server');

// Set NODE_ENV to test to suppress console logs
process.env.NODE_ENV = 'test';

describe('no route', function(){

  describe('GET /', function(){
    it('should return a routeNotFoundError', function(done){
      request(app)
      .get('/')
      .end(function(err, res){
        expect(res.status).to.equal(404);
        expect(res.body).to.be.an('object');
        expect(res.body).to.include.keys('name', 'message', 'status');
        expect(res.body.name).to.equal('routeNotFoundError');
        expect(res.body.message).to.equal('/ Route not found.');
        expect(res.body.status).to.equal(404);
        done();
      });
    });
  });
});
