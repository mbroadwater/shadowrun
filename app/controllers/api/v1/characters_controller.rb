class Api::V1::CharactersController < ApplicationController

  def show
    character = Character.find(params[:id])
    response = Api::V1::CharacterSerializer.new(character)
    render(json: response)
  end

  def index
    if params[:name]
      logger.debug("Name sent")
      character = Character.find_by(name: params[:name])
      response = Api::V1::CharacterSerializer.new(character)
      render(json: response)
    else
      logger.debug("params: #{params}")
      characters = Character.all

      render(
        json: ActiveModel::ArraySerializer.new(
          characters,
          each_serializer: Api::V1::CharacterSerializer,
          root: 'characters',
        )
      )
    end
  end
end
