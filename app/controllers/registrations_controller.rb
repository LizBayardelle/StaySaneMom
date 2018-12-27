class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      NewUserNotificationMailer.send_new_user_email(@user).deliver

      @client = Convertkit::Client.new
      @client.add_subscriber_to_sequence(269530, @user.email, options = {})
      @client.add_subscriber_to_tag(627854, @user.email, options = {})
    end
  end

  protected

  def after_update_path_for(resource)
    user_path(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin, :subscribed, :avatar, :tagline, :bio, :website_name, :website_url, :sm_youtube, :sm_email, :contributor, :contributor_request, :sm_approved)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :admin, :subscribed, :avatar, :tagline, :bio, :website_name, :website_url, :sm_youtube, :sm_email, :contributor, :contributor_request, :sm_approved)
  end
end
