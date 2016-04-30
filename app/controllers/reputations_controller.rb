class ReputationsController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @reputation = @character.reputations.create(reputation_params)
    redirect_to edit_character_path(@character)
  end

  def destroy
    @character = Character.find(params[:character_id])
    @reputation = @character.reputations.find(params[:id])
    @reputation.destroy
    redirect_to edit_character_path(@character)
  end

  private

    def reputation_params
      params.require(:defense).permit(:street_cred, :notoriety, :public_awareness)
    end
end
