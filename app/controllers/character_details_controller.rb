class CharacterDetailsController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @character_details = @character.character_details.create(character_detail_params)
    redirect_to edit_character_path(@character)
  end

  def update
    if change_cancelled?
      redirect_to edit_character_path(@character)
    else
      @character_details = CharacterDetails.find(params[:id])
      @character_details.update(character_details)
      redirect_to edit_character_path(@character)
    end
  end


  def destroy
    @character = Character.find(params[:character_id])
    @character_detail = @character.character_details.find(params[:id])
    @character_detail.destroy
    redirect_to edit_character_path(@character)
  end

  private

    def character_detail_params
      params.require(:character_detail).permit(:real_name, :concept, :description, :background, :metatype, :gender, :hair, :eyes, :ethnicity, :skin)
    end

    def change_cancelled?
      if params[:commit] == "Cancel"
        true
      else
        false
      end
    end

end
