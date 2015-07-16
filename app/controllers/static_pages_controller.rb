class StaticPagesController < ApplicationController
  skip_before_filter :require_login
  
  def home
    if logged_in?
      @drink = current_user.drinks.build
      @daily_drinks = Drink.all
    end
  end
end
