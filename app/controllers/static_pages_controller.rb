class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @character = current_user.characters.build
      @character.character_detail = CharacterDetail.new
      @character_feed_items = current_user.character_feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
