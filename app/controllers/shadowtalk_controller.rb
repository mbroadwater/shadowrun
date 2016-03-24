class ShadowtalkController < ApplicationController
  def show
   render :json => {"text": "reply"}
   params.inspect
  end
end
