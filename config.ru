# This file is used by Rack-based servers to start the application.

#require ::File.expand_path('../config/environment', __FILE__)
#run Rails.application

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load

require 'slack-mathbot'
require 'web'

Thread.abort_on_exception = true

Thread.new do
  begin
    SlackMathbot::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SlackMathbot::Web
