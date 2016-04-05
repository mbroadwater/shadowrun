require 'slack-gamebot/lib/shadow_dice_roll'

module SlackGamebot
  module Commands

    class ShadowRoll < SlackRubyBot::Commands::Base
      scan (/[0-9]+[e][0-9]*/i)

      def self.call(client, data, match)
        roll_text = data.text.slice!(/[0-9]+[e][0-9]*/i)
        client.say(channel: data.channel, text: roll_dice(roll_text))
      end

      def self.roll_dice(roll_text)
        dice_roll = ShadowDiceRoll.new(roll_text)
        build_reply_string(dice_roll)
      end

      def self.build_reply_string(dice_roll)
        roll_result = dice_roll.execute
        "Rolled #{dice_roll.quantity} and #{dice_roll.edge} edge with a result of #{roll_result}"
      end
    end
  end
end
