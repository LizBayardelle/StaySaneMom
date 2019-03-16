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
      amount: @amount,
      description: 'Customer: ' + current_user.first_name + " " + current_user.last_name,
      currency: 'usd',
    })

    current_basket.basket_status = 2

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


end
