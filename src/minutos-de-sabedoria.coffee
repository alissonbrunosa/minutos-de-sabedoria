# Description
#   A simple bot that gives to you an inspirational message
#
#
# Commands:
#   hubot teach me   - Returns a good message
#   hubot inspire me - Returns a good message
#
#
# Author:
#   Alisson Bruno <alissonbruno.sa@gmail.com>


pickOne = (body) ->
  messages = JSON.parse body
  randomIndex = Math.round(Math.random() * (messages.length - 1))
  return messages[randomIndex]



lookUpForMessage = (msg) ->
  msg.http("http://aecs.org.br/minutos/ajax/minutos.json")
  .header('Accept', 'application/json')
  .get() (err, res, body) ->
    return msg.send err.message if err
    message = pickOne(body)
    message = message.txt.trim()
    msg.send "*#{message}*"


module.exports = (robot) ->
  robot.respond /(teach|inspire) me/i, lookUpForMessage
