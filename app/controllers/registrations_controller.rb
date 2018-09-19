class RegistrationsController < Devise::RegistrationsController

  protected
  
  def after_update_path_for(resource)
    user_path(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin, :subscribed, :avatar, :tagline, :bio)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :admin, :subscribed, :avatar, :tagline, :bio)
  end
end
