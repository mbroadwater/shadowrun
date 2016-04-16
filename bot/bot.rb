require 'figaro'

class Bot < SlackRubyBot::Bot
  Figaro.load
end
