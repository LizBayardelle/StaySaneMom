class NewGuestPostIdeaNotificationMailer < ApplicationMailer
  default :from => 'liz@theStaySaneMom.com'

  def send_new_guest_post_idea_email(contribution)
    @contribution = contribution
    mail( :to => "lizbayardelle@gmail.com",
    :subject => 'New Guest Post Idea Alert!' )
  end
end
