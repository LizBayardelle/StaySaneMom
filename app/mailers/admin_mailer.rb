class AdminMailer < ApplicationMailer
  default :from => 'liz@thestaysanemom.com'

  def new_message(message)
    @message = message
    mail( :to => "liz@thestaysanemom.com",
    :subject => 'New Message on SSM' )
  end
end
