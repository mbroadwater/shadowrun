class Api::V1::CharacterDetailController < Api::V1::BaseController

  def show
    char_detail = CharacterDetail.find(params[:id])
    response = Api::V1::CharacterDetailSerializer.new(char_detail)
    render(json: response)
  end

  def index
    char_details = CharacterDetail.all

    render(
      json: ActiveModel::CharacterDetailSerializer.new(
        char_details,
        each_serializer: Api::V1::CharacterDetailSerializer,
        root: 'users',
      )
    )
  end
end
