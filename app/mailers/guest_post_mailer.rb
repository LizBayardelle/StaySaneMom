class GuestPostMailer < ApplicationMailer
  default :from => 'liz@theStaySaneMom.com'

  def post_idea(contribution)
    @contribution = contribution
    mail( :to => "liz@theStaySaneMom.com",
    :subject => 'New Guest Post Idea Alert!' )
  end


  def post_submitted(blog)
    @blog = blog
    mail( :to => "liz@theStaySaneMom.com",
    :subject => 'New Guest Post Needs Review' )
  end

  def post_published(blog)
    @blog = blog
    mail( :to => @blog.user.email,
    :subject => 'Your Post Has Been Published on The Stay Sane Mom' )
  end

end
