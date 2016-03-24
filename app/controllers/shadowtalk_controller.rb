class ShadowtalkController < ApplicationController
  def show
   render :json => params
  end
end
