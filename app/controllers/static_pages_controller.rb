class StaticPagesController < ApplicationController
  skip_before_filter :require_login
  
  def home
    if logged_in?
      @drink = current_user.drinks.build(volume: 8)
      @daily_drinks = Drink.paginate(page: params[:page])
      @total = Drink.total(Drink.all)
    end
  end
end
