$:.unshift File.dirname(__FILE__)

require 'bot'
require 'commands/shadow_talk'

Thread.abort_on_exception = true

Thread.new do
  Bot.run
end
