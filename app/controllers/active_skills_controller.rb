class ActiveSkillsController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @active_skills = @character.active_skills.create(active_skills_params)
    redirect_to edit_character_path(@character)
  end

  def destroy
    @character = Character.find(params[:character_id])
    @active_skill = @character.active_skills.find(params[:id])
    @active_skill.destroy
    redirect_to edit_character_path(@character)
  end

  private

    def active_skills_params
      params.require(:active_skill).permit(:base_skill_id, :value_base)
    end
end
