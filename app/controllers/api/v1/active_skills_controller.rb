class Api::V1::ActiveSkillsController < Api::V1::BaseController

  def show
    active_skill = ActiveSkill.find(params[:id])
    response = Api::V1::ActiveSkillSerializer.new(active_skill)
    render(json: response)
  end

  def index
    active_skills = ActiveSkill.all

    render(
      json: ActiveModel::ArraySerializer.new(
        active_skills,
        each_serializer: Api::V1::ActiveSkillSerializer,
        root: 'users',
      )
    )
  end
end
