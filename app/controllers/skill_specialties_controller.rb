class SkillSpecialtiesController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @skill_specialties = @character.skill_specialties.create(skill_specialties_params)
    redirect_to edit_character_path(@character)
  end

  def destroy
    @character = Character.find(params[:character_id])
    @skill_specialty = @character.skill_specialties.find(params[:id])
    @skill_specialty.destroy
    redirect_to edit_character_path(@character)
  end

  private

    def skill_specialties_params
      params.require(:skill_specialty).permit(:base_skill_specialty_id)
    end
end
