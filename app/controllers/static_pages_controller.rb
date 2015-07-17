class StaticPagesController < ApplicationController
  skip_before_filter :require_login
  
  def home
    if logged_in?
      @drink = current_user.drinks.build
      @daily_drinks = Drink.paginate(page: params[:page])
      @total = Drink.all.map(&:volume).sum
    end
  end
end
