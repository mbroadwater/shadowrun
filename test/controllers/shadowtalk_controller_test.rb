require 'test_helper'

class ShadowtalkControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should modify incoming JSON" do
    post :show
    assert_response :success
  end

end
