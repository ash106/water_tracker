require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:alex)
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_path
  end

  test "should get index" do
    login_user(@user)
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference 'User.count', 1 do
      post :create, user: { email: "test@example.org", password: "secret", password_confirmation: "secret" }
    end

    assert_redirected_to users_path
  end

  test "should redirect show when not logged in" do
    get :show, id: @user
    assert_redirected_to login_path
  end

  test "should show user" do
    login_user(@user)
    get :show, id: @user
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_redirected_to login_path
  end

  test "should get edit" do
    login_user(@user)
    get :edit, id: @user
    assert_response :success
  end

  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { email: "ralex@gmail.com", day_start_time: 11 }
    assert_redirected_to login_path
  end

  test "should update user" do
    login_user(@user)
    patch :update, id: @user, user: { email: "ralex@gmail.com", day_start_time: 11 }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to login_path
  end

  test "should destroy user" do
    login_user(@user)
    assert_difference 'User.count', -1 do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
