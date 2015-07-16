require 'test_helper'

class DrinksControllerTest < ActionController::TestCase
  def setup
    @user = users(:alex)
    @drink = drinks(:eight)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Drink.count' do
      post :create, drink: { volume: 8 }
    end
    assert_redirected_to login_path
  end

  test "should create drink" do
    login_user(@user)
    assert_difference 'Drink.count', 1 do
      post :create, drink: { volume: 8, user_id: @user.id }
    end
    assert_redirected_to root_path
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Drink.count' do
      delete :destroy, id: @drink
    end
    assert_redirected_to login_path
  end

  test "should destroy drink" do
    login_user(@user)
    assert_difference 'Drink.count', -1 do
      delete :destroy, id: @drink
    end
    assert_redirected_to root_path
  end
end
