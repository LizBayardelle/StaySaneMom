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

  def admin_or_contributor
    unless (current_user && current_user.admin) || (current_user && current_user.contributor)
      redirect_to root_path, notice: 'Sorry, you have to be a contributor or admin to do that!'
    end
  end

  def admin_or_author
    @blog = Blog.friendly.find(params[:id])
    unless (current_user && current_user.admin) || (current_user && current_user == @blog.user && @blog.submitted == false)
      redirect_to root_path, notice: "Sorry, you can't edit that blog right now."
    end
  end


  def admin_only
    unless current_user && current_user.admin
      redirect_to root_path, notice: 'Sorry, you have to be an admin to do that!'
    end
  end


  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  def add_subscriber
    # @client = Convertkit::Client.new
    # @client.add_subscriber_to_sequence(618663, params[:email], options = { first_name: params[:first_name] })
    # @client.add_subscriber_to_tag(1585457, params[:email], options = { first_name: params[:first_name] })
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
