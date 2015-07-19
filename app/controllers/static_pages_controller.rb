class StaticPagesController < ApplicationController
  skip_before_filter :require_login
  
  def home
    if logged_in?
      @drink = current_user.drinks.build(volume: 8)
      @daily_drinks = Drink.today(current_user)
      @total = Drink.total(@daily_drinks)
    end
  end
end
