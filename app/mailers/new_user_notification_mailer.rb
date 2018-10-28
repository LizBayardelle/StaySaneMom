class NewUserNotificationMailer < ApplicationMailer
  default :from => 'liz@theStaySaneMom.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_new_user_email(user)
    @user = user
    mail( :to => "lizbayardelle@gmail.com",
    :subject => 'New SSM User Alert!' )
  end
end
