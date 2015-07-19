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

  test "today should return only drinks created after day_start_time" do
    refute_includes Drink.today(@user.day_start_time), drinks(:eight)
    refute_includes Drink.today(@user.day_start_time), drinks(:five_am)
    assert_includes Drink.today(@user.day_start_time), drinks(:twenty_six)
    assert_includes Drink.today(@user.day_start_time), drinks(:most_recent)
    # Change day_start_time to 5 AM and verify correct drink is included
    assert_includes Drink.today(5), drinks(:five_am)
  end
end
