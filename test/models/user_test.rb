require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "user@example.com", day_start_time: 6, password: "secret", password_confirmation: "secret")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "associated drinks should be destroyed" do
    @user.save
    @user.drinks.create!(volume: 8)
    assert_difference 'Drink.count', -1 do
      @user.destroy
    end
  end

  test "day_start_time should be present" do
    @user.day_start_time = nil
    assert_not @user.valid?
  end
end
