module SlackGamebot
  module Commands

    class HoldForLater < SlackRubyBot::Commands::Base
      command 'something'

      def self.call(client, data, match)
        client.say(channel: data.channel, text: "Heard that."
      end
    end
  end
end
