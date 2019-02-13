class NewCapsuleReminderMailer < ApplicationMailer
  default :from => 'liz@theStaySaneMom.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_capsule_reminder_email(capsule)
    @capsule = capsule
    mail( :to => @capsule.user.email,
    :subject => "Tomorrow's the Day: Your Time Capsule Needs Filling!" )
  end
end
