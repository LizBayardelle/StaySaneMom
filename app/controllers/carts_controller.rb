class CartsController < ApplicationController
  def show
    @basket_items = current_basket.basket_items
  end


end
