require 'net/http'

module SlackGamebot
  module Commands

    class DeleteUserMessage < SlackRubyBot::Commands::Base
      #command (/./)

      def self.call(client, data, match)
        HTTParty.post("https://slack.com/api/chat.delete",
          :query => {
            :token => Rails.application.secrets.slack_secret_key,
            :ts => data.ts,
            :channel => data.channel
          },
          headers: {'Content-Type' => 'application/json'})

        client.say(channel: data.channel, text: "Hi!"))
      end
    end
  end
end
