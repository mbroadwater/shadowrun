class Api::V1::CharactersController < ApplicationController
  respond_to :json

  def show
    respond_with Character.find(params[:id])
  end
end
