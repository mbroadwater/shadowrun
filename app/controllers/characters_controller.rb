class CharactersController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :destroy]
  before_action :correct_user, only: :destroy
  # before_filter :check_for_cancel, :only => [:create, :update]

  def new
    @character = current_user.characters.build
    @character.character_detail = CharacterDetail.new

    render 'characters/new_character'
  end

  def create
    if change_cancelled?
      @character_feed_items = []
      redirect_to root_url
    else
      @character = current_user.characters.build(character_params)

        if @character.save
        (1..8).each do |base_att|
          char_attributes = @character.char_attributes.new
          char_attributes.base_attribute_id = base_att
          char_attributes.value_base = 1
          char_attributes.character.id = @character.id
          @character.save
        end
        char_attributes = @character.char_attributes.new
        char_attributes.base_attribute_id = 9
        char_attributes.value_base = 6
        char_attributes.character.id = @character.id
        @character.save
        (10..11).each do |base_att|
          char_attributes = @character.char_attributes.new
          char_attributes.base_attribute_id = base_att
          char_attributes.value_base = 1
          char_attributes.character.id = @character.id
          @character.save
        end



        flash[:success] = "Character created!"
        redirect_to root_url
      else
        @character_feed_items = []
        render 'static_pages/home'
      end
    end
  end

  def edit
    @character = Character.find(params[:id])
    if (!current_user?(@character.user))
      redirect_to root_url
    end
  end

  def destroy
    @character.destroy
    flash[:success] = "Character deleted"
    redirect_to request.referrer || root_url
  end

  def update
    if change_cancelled?
      redirect_to request.referrer || root_url
    else
      @character = Character.find(params[:id])
      if @character.update_attributes(character_params)
        flash[:success] = "Character Updated"
        redirect_to edit_character_path(@character)
      else
        render 'edit'
      end
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  private

    def character_params
      params.require(:character).permit(:name,
        character_detail_attributes:[:real_name, :concept, :description, :background, :metatype, :gender, :hair, :eyes, :ethnicity, :skin],
        char_attributes_attributes:[:id, :base_attribute_id, :value_base, :value_modified, :max_natural, :max_augmented, :category],
        active_skills_attributes:[:id, :base_attribute_id, :value_base, :value_modified, :max_natural, :max_augmented, :category],
        defenses_attributes:[:id, :def_type, :value_normal])
    end

    def correct_user
      @character = current_user.characters.find_by(id: params[:id])
      redirect_to root_url if @character.nil?
    end

    def change_cancelled?
      if params[:commit] == "Cancel"
        true
      else
        false
      end
    end
end
