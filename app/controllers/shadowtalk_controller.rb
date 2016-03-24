class ShadowtalkController < ApplicationController
  def show
    render :json => {"text": "reply"}
  end
end
