'use strict';
const chai = require('chai');
const expect = chai.expect;

const index = require('./index');

describe('Index', function() {
  it('should export something', function() {
    expect(index.something).to.equal('something');
  });
});
