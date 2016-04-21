class CharactersController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :destroy]
  before_action :correct_user, only: :destroy
  # before_filter :check_for_cancel, :only => [:create, :update]

  def create
    @character = current_user.characters.build(character_params)
    if @character.save
      flash[:success] = "Character created!"
      redirect_to root_url
    else
      @character_feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def destroy
    @character.destroy
    flash[:success] = "Character deleted"
    redirect_to request.referrer || root_url
  end

  def update
    @character = Character.find(params[:id])
    if @character.update_attributes(character_params)
      flash[:success] = "Character Updated"
      redirect_to edit_character_path(@character)
    else
      render 'edit'
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  private

    def character_params
      params.require(:character).permit(:name, :description)
    end

    def correct_user
      @character = current_user.characters.find_by(id: params[:id])
      redirect_to root_url if @character.nil?
    end

    # def check_for_cancel
    #   if params[:commit] == "Cancel"
    #     redirect_to current_user
    #   end
    # end
end
