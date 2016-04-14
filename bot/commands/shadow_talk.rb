require 'net/http'

module SlackGamebot
  module Commands

    class DeleteUserMessage < SlackRubyBot::Commands::Base
      match (/./)

      CHANNEL_ID_TEST = 'C0YRM40JH'
      CHANNEL_ID_PRIVATE = 'G0XT89YHF'

      def self.call(client, data, match)
        if data.channel == CHANNEL_ID_PRIVATE or data.channel == CHANNEL_ID_TEST
          # HTTParty.post("https://slack.com/api/chat.delete",
          #   query: {
          #     token: Rails.application.secrets.slack_secret_key,
          #     ts: data.ts,
          #     channel: data.channel
          #   },
          #   headers: {'Content-Type' => 'application/json'})

          client.say(channel: data.channel, text: create_comment_text(data.user, data.text))
        end
      end

      private

      def self.assign_toon_name(user)
        toon_names = {
          "U06V1NG1M" => "Spooky",
          "U0716T668" => "SINderella",
          "U0705GQTT" => "Shugga Bear",
          "U06V2Q87J" => "Mack",
          "U07089JV9" => "Mickey",
          "U070A5C1Y" => "Brownie",
          "U071T1EKV" => "God Himself"
        }

        toon_names[user]
      end

      def self.strip_forbidden_characters(text)
        text.slice!(/\](&lt;)+/)
        text.slice!(/(&gt;)+\[/)
      end

      def self.create_comment_text(user, text)
        open_text = "\u00AD&gt;&gt;&gt;&gt;&gt;["
        close_text = "]&lt;&lt;&lt;&lt;&lt;"

        if(user == "U071T1EKV")
          submitted_name = text.partition(" ").first
          text.slice!(submitted_name)
          toon_name_text = submitted_name.gsub('_', ' ')
        else
          toon_name_text = assign_toon_name(user)
        end

        clean_text = strip_forbidden_characters(text)

        #post_time = Time.now + 59.years + Time.zone_offset("CST")
        post_time = Time.now + 59.years
        post_time_text = post_time.strftime("%H:%M:%S / %m-%d-%Y")

        # Do a better job with this later when you have users

        if toon_name_text.empty?
          0
        else
          "#{open_text}#{text}#{close_text}\n \u2014 #{toon_name_text} <#{post_time_text}>"
        end

      end

    end
  end
end
