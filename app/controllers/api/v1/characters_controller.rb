class Api::V1::CharactersController < ApplicationController

  def show
    character = Character.find(params[:id])
    response = Api::V1::CharacterSerializer.new(character)
    render(json: response)
  end

  def index
    if params[:name]
      character = Character.find_by(name: params[:name])
      if character.nil?
        response = "Character does not exist."
      else
        response = Api::V1::CharacterSerializer.new(character)
        render(json: response)
      end
    else
      render plain: "Not authorized", status: 401
    #   characters = Character.all
    #
    #   render(
    #     json: ActiveModel::ArraySerializer.new(
    #       characters,
    #       each_serializer: Api::V1::CharacterSerializer,
    #       root: 'characters',
    #     )
    #   )
    end
  end
end
