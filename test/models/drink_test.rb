require 'test_helper'

class DrinkTest < ActiveSupport::TestCase
  def setup
    @user = users(:alex)
    @drink = @user.drinks.build(volume: 8)
  end

  test "should be valid" do
    assert @drink.valid?
  end

  test "user id should be present" do
    @drink.user_id = nil
    assert_not @drink.valid?
  end

  test "volume should be present" do
    @drink.volume = nil
    assert_not @drink.valid?
  end

  test "volume should be at least 1" do
    @drink.volume = -1
    assert_not @drink.valid?
    @drink.volume = 0
    assert_not @drink.valid?
    @drink.volume = 0.5
    assert_not @drink.valid?
    @drink.volume = 1
    assert @drink.valid?
  end

  test "order should be most recent first" do
    assert_equal drinks(:most_recent), Drink.first
  end

  test "total should return the sum of volumes of a group of drinks" do
    drinks = []
    4.times { drinks << Drink.new(volume: 8) }
    assert_equal 32, Drink.total(drinks)
  end

  test "today should return only drinks for the current user created after day_start_time" do
    refute_includes Drink.today(@user), drinks(:eight)
    refute_includes Drink.today(@user), drinks(:five_am)
    refute_includes Drink.today(@user), drinks(:craig)
    assert_includes Drink.today(@user), drinks(:twenty_six)
    assert_includes Drink.today(@user), drinks(:most_recent)
    # Change day_start_time to 5 AM and verify correct drink is included
    @user.day_start_time = 5
    assert_includes Drink.today(@user), drinks(:five_am)
  end
end
