class DefensesController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @defense = @character.defenses.create(defense_params)
    redirect_to edit_character_path(@character)
  end

  def destroy
    @character = Character.find(params[:character_id])
    @defense = @character.defenses.find(params[:id])
    @defense.destroy
    redirect_to edit_character_path(@character)
  end

  private

    def defense_params
      params.require(:defense).permit(:def_type, :value_normal)
    end
end
