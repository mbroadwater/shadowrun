$:.unshift File.dirname(__FILE__)

require 'shadowbot'

Thread.abort_on_exception = true

Thread.new do
  ShadowBot.run
end
