require 'sinatra/base'

module SlackGamebot
  class Web < Sinatra::Base
    get '/' do
      'Gaming is good for you!'
    end
  end
end
