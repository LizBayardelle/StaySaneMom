class BasketItemsController < ApplicationController
  def create
    @basket = current_basket
    @basket_item = @basket.basket_items.build(basket_item_params)
    if @basket.save
      respond_to do |format|
        format.js
        format.html
      end
    else
      alert "Something went wrong!"
    end
    session[:basket_id] = @basket.id
  end

  def update
    @basket = current_basket
    @basket_item = @basket.basket_items.find(params[:id])
    if @basket_item.update_attributes(basket_item_params)
      respond_to do |format|
        format.js
        format.html
      end
    else
      alert "Something went wrong!"
    end
    @basket_items = @basket.basket_items
  end

  def destroy
    @basket = current_basket
    @basket_item = @basket.basket_items.find(params[:id])
    if @basket_item.destroy
      respond_to do |format|
        format.js
        format.html
      end
    else
      alert "Something went wrong!"
    end
    @basket_items = @basket.basket_items
  end

  private

  def basket_item_params
    params.require(:basket_item).permit(:quantity, :variation_id)
  end
end
