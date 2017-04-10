Helper = require('hubot-test-helper')
expect = require('chai').expect
helper = new Helper('../src/minutos-de-sabedoria.coffee')
nock = require('nock')

MESSAGE = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'

describe 'minutos-de-sabedoria', ->
  room = null

  beforeEach ->
    room = helper.createRoom()
    do nock.disableNetConnect
    nock('http://aecs.org.br',{
      reqheaders: {
        'Accept': 'application/json'
      }
    })
    .get('/minutos/ajax/minutos.json')
    .reply 200, [{ txt: MESSAGE }]

  afterEach ->
    room.destroy()
    nock.cleanAll()

  context 'user asks hubot for a good message', ->
    beforeEach (done) ->
      room.user.say 'Alisson', 'hubot teach me'
      setTimeout done, 100

    it 'should receive a good message', ->
      expect(room.messages).to.eql [
        [ 'Alisson', 'hubot teach me' ]
        [ 'hubot', "*#{MESSAGE}*" ]
      ]
