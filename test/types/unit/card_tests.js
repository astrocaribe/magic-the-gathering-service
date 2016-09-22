/* global  it, describe */

'use strict';
var proxyquire = require('proxyquire').noCallThru();
var sinon  = require('sinon');
var expect = require('chai').expect;

var db   = {'getCardsQuery': function(){}};
var card = proxyquire('../../../card', {'./db': db});

var mockRequest = [{'color_1':'Green', 'color_2':'Black', 'color_3':'White'},
                   {'color_1':'Red', 'color_2':'Blue', 'color_3':null}];


describe('card', function(){

  afterEach(function(){
    db.getCardsQuery.restore();
  });

  describe('.getCardCollection', function(){
    it('should return collection given valid request', function(done) {

      var mockResponse = {'data':[{'colors':['Green','Black','White']},{'colors':['Red','Blue']}],'count':2};

      sinon.stub(db, 'getCardsQuery').callsArgWith(0, null, mockRequest);
      var spy = sinon.spy();

      card.getCardCollection(spy);

      expect(spy.calledOnce).to.be.true;
      expect(spy.calledWith(null, mockResponse)).to.be.true;

      done();
    });

    it('should return an error given invalid response', function(done){

      sinon.stub(db, 'getCardsQuery').callsArgWith(0, 'someError', mockRequest);
      var spy = sinon.spy();

      card.getCardCollection(spy);

      expect(spy.calledOnce).to.be.true;
      expect(spy.calledWith('someError', null)).to.be.true;

      done();
    });
  });
});
