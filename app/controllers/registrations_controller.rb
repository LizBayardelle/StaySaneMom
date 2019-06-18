class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      # NewUserNotificationMailer.send_new_user_email(@user).deliver

      @client = Convertkit::Client.new
      @client.add_subscriber_to_sequence(269530, @user.email, options = {})
      @client.add_subscriber_to_tag(627854, @user.email, options = {})
    end
  end

  def update
    @old_facebook = @user.sm_facebook
    @old_pinterest = @user.sm_pinterest
    @old_instagram = @user.sm_instagram
    @old_twitter = @user.sm_twitter
    @old_youtube = @user.sm_youtube
    @old_email = @user.sm_email
    @old_other = @user.sm_other
    super
    if @user.sm_facebook != @old_facebook
      @user.update_attributes(sm_approved: false)
    end
    if @user.sm_pinterest != @old_pinterest
      @user.update_attributes(sm_approved: false)
    end
    if @user.sm_instagram != @old_instagram
      @user.update_attributes(sm_approved: false)
    end
    if @user.sm_twitter != @old_twitter
      @user.update_attributes(sm_approved: false)
    end
    if @user.sm_youtube != @old_youtube
      @user.update_attributes(sm_approved: false)
    end
    if @user.sm_email != @old_email
      @user.update_attributes(sm_approved: false)
    end
    if @user.sm_other != @old_other
      @user.update_attributes(sm_approved: false)
    end
  end

  protected

  def after_update_path_for(resource)
    user_path(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin, :subscribed, :avatar, :tagline, :bio, :website_name, :website_url, :sm_youtube, :sm_email, :sm_facebook, :sm_pinterest, :sm_instagram, :sm_twitter, :sm_other, :sm_youtube, :sm_email, :contributor, :contributor_request, :sm_approved, :sm_needs_approval, :source)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :admin, :subscribed, :avatar, :tagline, :bio, :website_name, :website_url, :sm_youtube, :sm_email, :sm_facebook, :sm_pinterest, :sm_instagram, :sm_twitter, :sm_other, :sm_youtube, :sm_email, :contributor, :contributor_request, :sm_approved, :sm_needs_approval, :source)
  end
end
