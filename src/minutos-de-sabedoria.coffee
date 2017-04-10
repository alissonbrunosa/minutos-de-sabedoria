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

module.exports = (robot) ->
  robot.respond /(teach|inspire) me/, (res) ->
    message = lookUpForMessage
    res.send "*#{message}*"


lookUpForMessage = () ->
  robot.http("http://aecs.org.br/minutos/ajax/minutos.json").get() (err, res, body) ->
    messages = JSON.parse body
    randomIndex = Math.round(Math.random() * (messages.length - 1)) + 1
    return messages[randomIndex].txt.trim();
