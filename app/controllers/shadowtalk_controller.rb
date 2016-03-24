class ShadowtalkController < ApplicationController
  def show
   # render :json => {"response_type": "in_channel", "text": "Progress!"}
   logger.debug (@params)

   @reply ={
       "response_type": "in_channel",
       "text" => "Progress!",
     }.to_json

  end
end
