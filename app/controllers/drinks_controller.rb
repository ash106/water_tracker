class DrinksController < ApplicationController
  def create
    @drink = current_user.drinks.build(drink_params)
    if @drink.save
      flash[:success] = "Drink saved!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    drink = current_user.drinks.find_by(id: params[:id])
    drink.destroy
    flash[:success] = "Drink deleted"
    redirect_to root_url
  end

  private

    def drink_params
      params.require(:drink).permit(:volume)
    end
end
