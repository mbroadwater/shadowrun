class DefensesController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @defense = @character.defenses.create(defense_params)
    redirect_to edit_character_path(@character)
  end

  def update
    if change_cancelled?
      redirect_to edit_character_path(@character)
    else
      @defense = Defense.find(params[:id])
      @defense.update(defense_params)
      redirect_to edit_character_path(@character)
    end
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

    def change_cancelled?
      if params[:commit] == "Cancel"
        true
      else
        false
      end
    end
end
