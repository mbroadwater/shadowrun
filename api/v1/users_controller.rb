class Api::V1::UsersController < ApplicationController
  respond_to :json
  protect_from_forgery with: :null_session
  before_action :destroy_session

  def show
     render User.find(params[:id])

    render(json: Api::V1::UserSerializer.new(user).to_json)
  end

  private
    def destroy_session
      request.session_options[:skip] = true
    end

end
