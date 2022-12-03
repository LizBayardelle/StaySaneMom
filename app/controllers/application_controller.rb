class ApplicationController < ActionController::Base
  protected
  protect_from_forgery with: :exception
  helper_method :current_basket

  require "dotenv"
  Dotenv.load(".env.local")


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


end
