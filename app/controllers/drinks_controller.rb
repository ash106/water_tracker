class DrinksController < ApplicationController
  def create
    @drink = current_user.drinks.build(drink_params)
    if @drink.save
      redirect_to root_url, success: "Drink saved!"
    else
      render 'static_pages/home'
    end
  end

  def destroy
    drink = current_user.drinks.find_by(id: params[:id])
    drink.destroy
    redirect_to root_url, success: "Drink deleted"
  end

  private

    def drink_params
      params.require(:drink).permit(:volume)
    end
end
