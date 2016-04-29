class Api::V1::SkillSpecialtiesController < Api::V1::BaseController
  def show
    skill_specialty = SkillSpecialty.find(params[:id])
    response = Api::V1::SkillSpecialtySerializer.new(active_skill)
    render(json: response)
  end
end
