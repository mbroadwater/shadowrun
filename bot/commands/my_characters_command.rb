require 'rest-client'

class MyCharactersCommand < SlackRubyBot::Commands::Base
  match('/my characters/i') do |client, data, match|
    # response = RestClient.get('https://shadowguild.herokuapp.com/api/v1/users/')
    response = RestClient.get('localhost:3000/api/v1/users/')
    response_json = JSON.parse(response)

    logger.debug(data)

    response_json["users"].each do |user|
      if data[:user] == user.dig("slack_id")
        reply_text = "You have #{user.dig('characters').length}:"
        user.dig('characters').each do |char|
          reply_text += " #{char["name"]}"
        end
        reply_text += "."
        client.say(channel: data.channel, text: reply_text)
      end
    end
  end
end
