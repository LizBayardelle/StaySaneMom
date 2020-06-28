class ApplicationController < ActionController::Base
  protected
  protect_from_forgery with: :exception
  helper_method :current_basket

  require "dotenv"
  Dotenv.load(".env.local")

  Convertkit.configure do |config|
    config.api_secret = ENV["CONVERTKIT_API_SECRET"]
    config.api_key = ENV["CONVERTKIT_API_KEY"]
  end

  def current_basket
    if !session[:basket_id].nil?
      Basket.find(session[:basket_id])
    else
      Basket.new(basket_status_id: 1)
    end
  end

  def clear_basket
    session[:basket_id] = nil
  end

  # @client = Convertkit::Client.new

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  def add_subscriber
    @client = Convertkit::Client.new
    @client.add_subscriber_to_sequence(618663, params[:email], options = { first_name: params[:first_name] })
    @client.add_subscriber_to_tag(1585457, params[:email], options = { first_name: params[:first_name] })
    # INTRO SEQUENCE 618663
    # HOUSE 669064
    # MARRIAGE 669065
    # BABIES 1610281
    # TODDLERS 1610280
    # KIDS 669066
    # TEENS 1610279
    # BALANCE 669067
  end

end
