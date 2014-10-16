CBPlus = require '../src/index'
# assert = require('power-assert')
assert = require "assert"


describe "Code breaker plus", ->
  it "should throw Error when passed string", ->
    assert.throws ->
      q = CBPlus "hello"
      console.log "1st assert"
  it "should throw Error when guess does not have same length as answers", ->
    assert.throws ->
      q = CBPlus 1234
      q.getHint 12345
  it "should return true if the guess mathes the answer", ->
    q = CBPlus 1234
    g = q.getHint 1234
    assert.equal g, true
  