require 'figaro'
require 'commands/show_character_command'
# require 'commands/my_characters_command'
# require 'commands/shadow_talk'

class ShadowBot < SlackRubyBot::Bot
  Figaro.load
end
