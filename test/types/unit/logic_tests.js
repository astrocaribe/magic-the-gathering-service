/* global  it, describe, afterEach */

'use strict';
var proxyquire = require('proxyquire').noCallThru();
var sinon = require('sinon');
var expect = require('chai').expect;

var db = {'getCardsQuery': function(){}};
var logic = proxyquire('../../../logic', {'./db': db});

describe('logic', function(){
  afterEach(function(){
    db.getCardsQuery.restore();
  });

  describe('.getCardCollection', function(){
    describe('with a valid page request parameter', function(){
      it('should return collection given valid request', function(done) {
        var mockRequest = [{'color_1':'Green', 'color_2':'Black', 'color_3':'White'},
                           {'color_1':'Red', 'color_2':'Blue', 'color_3':null}];

        var mockResponse = {'data':[{'colors':['Green','Black','White']},{'colors':['Red','Blue']}],'page':0, 'totalCount':2};

        sinon.stub(db, 'getCardsQuery').callsArgWith(0, null, mockRequest);
        var spy = sinon.spy();

        logic.getCardCollection(0, spy);

        expect(spy.calledOnce).to.be.true;
        expect(spy.calledWith(null, mockResponse)).to.be.true;

        mockResponse = {};
        done();
      });

      it('should return an error given invalid response', function(done){
        var mockRequest = [{'color_1':'Green', 'color_2':'Black', 'color_3':'White'},
                           {'color_1':'Red', 'color_2':'Blue', 'color_3':null}];

        sinon.stub(db, 'getCardsQuery').callsArgWith(0, 'someError', mockRequest);
        var spy = sinon.spy();

        logic.getCardCollection(0, spy);

        expect(spy.calledOnce).to.be.true;
        expect(spy.calledWith('someError', null)).to.be.true;

        done();
      });
    });

    describe('with an undefined page query paramter', function(){
      it('should return collection given valid request', function(done) {
        var mockRequest = [{'color_1':'Green', 'color_2':'Black', 'color_3':'White'},
                           {'color_1':'Red', 'color_2':'Blue', 'color_3':null}];

        var mockResponse = {'data':[{'colors':['Green','Black','White']},{'colors':['Red','Blue']}],'page':0, 'totalCount':2};

        sinon.stub(db, 'getCardsQuery').callsArgWith(0, null, mockRequest);
        var spy = sinon.spy();

        logic.getCardCollection(undefined, spy);

        expect(spy.calledOnce).to.be.true;
        expect(spy.calledWith(null, mockResponse)).to.be.true;

        done();
      });
    });

    describe('with page query parameter beyond results set', function(){
      it('should return an empty results set', function(done){
        var mockRequest = [{'color_1':'Green', 'color_2':'Black', 'color_3':'White'},
                           {'color_1':'Red', 'color_2':'Blue', 'color_3':null}];

        var mockResponse = {'data':[],'page':2, 'totalCount':2};

        sinon.stub(db, 'getCardsQuery').callsArgWith(0, null, mockRequest);
        var spy = sinon.spy();

        logic.getCardCollection(2, spy);

        expect(spy.calledOnce).to.be.true;
        expect(spy.calledWith(null, mockResponse)).to.be.true;

        done();
      });
    });


  });
});
