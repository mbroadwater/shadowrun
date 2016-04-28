class Api::V1::DefensesController < Api::V1::BaseController

  def show
    defense = Defense.find(params[:id])
    response = Api::V1::DefenseSerializer.new(defense)
    render(json: response)
  end

  def index
    defenses = Defense.all

    render(
      json: ActiveModel::ArraySerializer.new(
        defenses,
        each_serializer: Api::V1::DefenseSerializer,
        root: 'users',
      )
    )
  end
end
