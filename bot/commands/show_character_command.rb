require 'rest-client'

class ShowCharacterCommand < SlackRubyBot::Commands::Base
  match /^show (?<character>\w*)$/ do |client, data, match|
    response = RestClient.get('https://shadowguild.herokuapp.com/api/v1/users/')
    # response = RestClient.get("localhost:3000/api/v1/characters/?name=Spook2")
    response_json = JSON.parse(response)
    client.say(channel: data.channel, text: response_json)
    # logger.debug("character #{match[:character]}")
    logger.debug("match: #{match}")
  end
end
