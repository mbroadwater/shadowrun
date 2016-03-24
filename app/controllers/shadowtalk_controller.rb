class ShadowtalkController < ApplicationController
  def show
   render :json => {"response_type": "in_channel", "text": "Progress!"}
  end
end
