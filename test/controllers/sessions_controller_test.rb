require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:alex)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should redirect destroy when not logged in" do
    get :destroy
    assert_redirected_to login_url
  end

  test "should get destroy" do
    login_user(@user)
    get :destroy
    assert_redirected_to root_path
    assert_equal "Logged out!", flash[:notice]
  end
end
