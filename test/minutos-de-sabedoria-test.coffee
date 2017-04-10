Helper = require('hubot-test-helper')
expect = require('chai').expect
helper = new Helper('../src/minutos-de-sabedoria.coffee')

describe 'minutos-de-sabedoria', ->
  room = null

  beforeEach ->
    room = helper.createRoom()

  afterEach ->
    room.destroy()

  context 'user asks hubot for a good message', ->
    beforeEach ->
      room.user.say 'Aisson', '@hubot teach me'

    it 'should receive a message', ->
      expect(room.messages.length).to.eql 2
