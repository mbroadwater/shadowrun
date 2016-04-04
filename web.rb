require 'sinatra/base'

module SlackGamebot
  class Web < Sinatra::base
    get '/' do
      'Gaming is good for you!'
    end
  end
end
