require 'slack-gamebot/lib/dice_roll'

module SlackGamebot
  module Commands

    class StandardRoll < SlackRubyBot::Commands::Base
      scan (/[0-9]*[d][0-9]+[+-]?[0-9]*/i)

      def self.call(client, data, match)
        roll_text = data.text.slice!(/[0-9]*d[0-9]+[+-]?[0-9]*/i)
        client.say(channel: data.channel, text: roll_dice(roll_text))
      end

      def self.roll_dice(roll_text)
        dice_roll = DiceRoll.new(roll_text)
        roll_result = dice_roll.execute
        "Rolled #{dice_roll.base} with a result of #{roll_result.sum + dice_roll.mod_value} #{roll_result}"
      end
    end
  end
end
