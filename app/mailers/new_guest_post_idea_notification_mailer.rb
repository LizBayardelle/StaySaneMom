class NewGuestPostIdeaNotificationMailer < ApplicationMailer
  default :from => 'liz@theStaySaneMom.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_new_guest_post_idea_email(contribution)
    @contribution = contribution
    mail( :to => "liz@theStaySaneMom.com",
    :subject => 'New Guest Post Idea Alert!' )
  end
end
