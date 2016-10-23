/* global describe, it, beforeEach, afterEach */

'use strict';

var expect = require('chai').expect;
var sinon = require('sinon');
var proxyquire = require('proxyquire').noCallThru();

var logic = {'getCardCollection': function(){}};
var handlers = proxyquire('../../../handlers', {'./logic': logic});

// Mock request and response
var req = {};
var res = {};
res.send = function(){};
res.status = function(){};

//  Mock and mute logger
var log = {};
log.error = (input) => {
  // console.log(input);
};

// Set NODE_ENV to test to supress console logs
process.env.NODE_ENV = 'test';

describe('handlers', function(){
  afterEach(function(){
    res.send.restore();
  });

  describe('.pingHandler', function(){
    it('should return a ping message', function(done){
      req.method = 'GET';
      req.url = '/ping';

      var spy = sinon.spy(res, 'send');

      handlers.pingHandler(req, res);
      var callArgs = res.send.getCall(0).args[0];

      expect(spy.calledOnce).to.be.true;

      expect(callArgs).to.be.an('object');
      expect(callArgs).to.include.keys('name', 'version', 'description');
      expect(callArgs.name).to.equal('magic-the-gathering-service');
      expect(callArgs.version).to.equal('1.0.0');

      done();
    });
  });

  describe('.noRouteHandler', function(){
    beforeEach(function(){
      req.method = 'GET';
      req.url = '/bogusRoute';
      req.path = '/bogusRoute';
      req.log = log;
    });

    afterEach(function(){
      res.status.restore();
    });

    it('should be called with a 404 status', function(done){
      var sendSpy   = sinon.spy(res, 'send');
      var statusSpy = sinon.spy(res, 'status');

      handlers.noRouteHandler(req, res);

      expect(statusSpy.calledOnce).to.be.true;
      expect(statusSpy.calledWith(404)).to.be.true;
      done();
    });

    it('should return a noRouteFoundError message', function(done){
      var sendSpy   = sinon.spy(res, 'send');
      var statusSpy = sinon.spy(res, 'status');

      handlers.noRouteHandler(req, res);

      var callArgs = res.send.getCall(0).args[0];

      expect(sendSpy.calledOnce).to.be.true;
      expect(callArgs).to.be.an('error');
      expect(callArgs).to.include.keys('name', 'message', 'status');
      expect(callArgs.name).to.equal('routeNotFoundError');
      expect(callArgs.message).to.equal('/bogusRoute Route not found.');
      expect(callArgs.status).to.equal(404);

      done();
    });
  });

  describe('.getCardCollection', function(){
    beforeEach(function(){
      req.methos = 'GET';
      req.url = '/cards';
      req.log = log;
      req.query = {};
      req.query.page = 0;
    });

    afterEach(function(){
      logic.getCardCollection.restore();
      res.status.restore();
    });

    it('should call getCardCollection with a valid response', function(done){
      sinon.stub(logic, 'getCardCollection').callsArgWith(1, null, 'someResult');
      var sendSpy = sinon.spy(res, 'send');
      var statusSpy = sinon.spy(res, 'status');

      handlers.getCardsHandler(req, res);

      var callArgs = res.send.getCall(0).args[0];

      expect(sendSpy.calledOnce).to.be.true;
      expect(statusSpy.calledOnce).to.be.true;
      expect(callArgs).to.be.a('string');
      expect(callArgs).to.equal('someResult');

      done();
    });

    it('should call getCardCollection with error response', function(done){
      sinon.stub(logic, 'getCardCollection').callsArgWith(1, 'someError', 'someResult');
      var sendSpy = sinon.spy(res, 'send');
      var statusSpy = sinon.spy(res, 'status');

      handlers.getCardsHandler(req, res);

      var callArgs = res.send.getCall(0).args[0];

      expect(sendSpy.calledOnce).to.be.true;
      expect(statusSpy.calledOnce).to.be.true;
      expect(callArgs).to.be.an('error');
      expect(callArgs).to.include.keys('name', 'message', 'status');
      expect(callArgs.name).to.equal('someError');
      expect(callArgs.message).to.equal('Internal Server Error.');
      expect(callArgs.status).to.equal(500);

      done();
    });
  });
});
