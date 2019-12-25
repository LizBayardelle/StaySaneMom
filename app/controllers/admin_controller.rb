class AdminController < ApplicationController
before_action :admin_only

  def resources
    @resources = Resource.all
  end

  def admin_only
    unless current_user && current_user.admin
      redirect_to root_path, notice: 'Sorry, you have to be an admin to do that!'
    end
  end

end
