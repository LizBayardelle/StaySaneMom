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
      Basket.new
    end
  end
  helper_method :current_basket


  def clear_basket
    session[:basket_id] = nil
  end

  # @client = Convertkit::Client.new

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  helper_method :spree_current_user
  helper_method :spree_login_path
  helper_method :spree_signup_path
  helper_method :spree_logout_path

  def spree_current_user
    current_user
  end

  def spree_login_path
    new_user_session_path
  end

  def spree_signup_path
    new_user_registration_path
  end

  def spree_logout_path
    main_app.user_path(current_user)
  end
end
