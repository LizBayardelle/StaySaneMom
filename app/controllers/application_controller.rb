class ApplicationController < ActionController::Base
  protected

  require "dotenv"
  Dotenv.load(".env.local")

  Convertkit.configure do |config|
    config.api_secret = ENV["CONVERTKIT_API_SECRET"]
    config.api_key = ENV["CONVERTKIT_API_KEY"]
  end

  # @client = Convertkit::Client.new

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
end
