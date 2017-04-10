chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'minutos-de-sabedoria', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()
    require('../src/minutos-de-sabedoria')(@robot)


  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(teach|inspire) me/)
