class NewUserNotificationMailer < ApplicationMailer
  default :from => 'liz@theStaySaneMom.com'

  def send_new_user_email(user)
    @user = user
    mail( :to => "liz@thestaysanemom.com",
    :subject => 'New SSM User Alert!' )
  end
end
