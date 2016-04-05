module SlackGamebot
  module Commands

    class RollDice < SlackRubyBot::Commands::Base
      scan 'roll'

      def self.call(client, data, match)
        roll_text = data.text.strip
        roll_text.slice!("roll")
        client.say(channel: data.channel, text: roll_dice(roll_text))
      end

      def self.roll_dice(roll_text)
#        roll = Hash.new
        roll = create_roll(roll_text)

        if roll["mod_type"] == "plus" then
          roll.store("die_value", roll["die_and_mod"].split("+")[0].to_i)
          roll.store("mod_value", roll["die_and_mod"].split("+")[1].to_i)
        elsif roll["mod_type"] == "minus" then
          roll.store("die_value", roll["die_and_mod"].split("-")[0].to_i)
          roll.store("mod_value", 0 - roll["die_and_mod"].split("-")[1].to_i)
        else
          roll.store("die_value", roll["die_and_mod"].to_i)
          roll.store("mod_value", 0)
        end

        results = Array.new()
        roll.store("results", results)
        roll["die_quantity"].times do
          roll["results"].push(1 + rand(roll["die_value"]))
        end

        roll.store("roll_sum", roll["results"].sum + roll["mod_value"])
        "Rolled #{roll["original_roll"]} with a result of #{roll["roll_sum"]} #{roll["results"]}"
      end

      def self.create_roll(roll_text)
        roll = Hash.new

        roll.store("original_roll", roll_text)
        roll.store("mod_type", find_modifier(roll_text))
        roll.store("die_quantity", roll_text.split("d")[0].to_i)
        roll.store("die_and_mod", roll_text.split("d")[1])

        return roll
      end

      def self.find_modifier(roll_text)
        if(roll_text.split("+")[1])
          "plus"
        elsif (roll_text.split("-")[1])
          "minus"
        else
          "none"
        end
      end
    end
  end
end
