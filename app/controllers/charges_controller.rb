class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = current_basket.subtotal

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount.to_i * 100,
      description: 'Customer: ' + current_user.first_name + " " + current_user.last_name,
      currency: 'usd',
    })

    current_basket.update_attributes(basket_status_id: 2)
    @previous_basket =  current_basket
    clear_basket

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


end
