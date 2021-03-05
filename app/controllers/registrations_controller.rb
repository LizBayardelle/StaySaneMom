class RegistrationsController < Devise::RegistrationsController
  # prepend_before_action :check_captcha, only: :create
  invisible_captcha only: [:create], honeypot: :subtitle

  def create

    super

    if @user.persisted?
      if params[:purchase_id]
        purchase = Purchase.find(params[:purchase_id])
        purchase.user_id = @user.id
        purchase.save
      end

      Preauthorization.all.each do |pre|
        if @user.email == pre.email
          @user.update_attributes(admin: pre.admin, contributor: pre.contributor)
          pre.update_attributes(fulfilled: true)
        end
      end

      # NewUserNotificationMailer.send_new_user_email(@user).deliver
      @client = Convertkit::Client.new
      # @client.add_subscriber_to_sequence(618663, @user.email, options = { first_name: @user.first_name })
      # @client.add_subscriber_to_tag(1585457, @user.email, options = { first_name: @user.first_name })
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

  def after_sign_up_path_for(resource)
    static_path(:ThankYou)
  end

  private

  # def check_captcha
  #   unless verify_recaptcha
  #     self.resource = resource_class.new sign_up_params
  #     resource.validate # Look for any other validation errors besides Recaptcha
  #     respond_with_navigational(resource) { redirect_to new_user_registration_path }
  #   end
  # end

  def sign_up_params
    params.require(:user).permit(:first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :admin,
      :subscribed,
      :avatar,
      :tagline,
      :bio,
      :website_name,
      :website_url,
      :sm_youtube,
      :sm_email,
      :sm_facebook,
      :sm_pinterest,
      :sm_instagram,
      :sm_twitter,
      :sm_other,
      :sm_youtube,
      :sm_email,
      :contributor,
      :contributor_request,
      :sm_approved,
      :sm_needs_approval,
      :source
    )
  end

  def account_update_params
    params.require(:user).permit(:first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :current_password,
      :admin,
      :subscribed,
      :avatar,
      :tagline,
      :bio,
      :website_name,
      :website_url,
      :sm_youtube,
      :sm_email,
      :sm_facebook,
      :sm_pinterest,
      :sm_instagram,
      :sm_twitter,
      :sm_other,
      :sm_youtube,
      :sm_email,
      :contributor,
      :contributor_request,
      :sm_approved,
      :sm_needs_approval,
      :source
    )
  end
end
