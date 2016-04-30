class CharAttributesController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @char_attributes = @character.char_attributes.create(char_attribute_params)
    redirect_to edit_character_path(@character)
  end

  def update
    if change_cancelled?
      redirect_to edit_character_path(@character)
    else
      @char_attribute = CharAttribute.find(params[:id])
      @char_attribute.update(char_attribute_params)
      redirect_to edit_character_path(@character)
    end
  end

  def destroy
    @character = Character.find(params[:character_id])
    @char_attribute = @character.char_attributes.find(params[:id])
    @char_attribute.destroy
    redirect_to edit_character_path(@character)
  end

  private

    def char_attribute_params
      params.require(:char_attribute).permit(:base_attribute_id, :value_base, :value_modified, :max_natural, :max_augmented, :category)
    end

    def change_cancelled?
      if params[:commit] == "Cancel"
        true
      else
        false
      end
    end

end
