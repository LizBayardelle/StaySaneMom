class GuestPostMailer < ApplicationMailer
  default :from => 'liz@theStaySaneMom.com'

  def post_idea(contribution)
    @contribution = contribution
    mail( :to => "liz@theStaySaneMom.com",
    :subject => 'New Guest Post Idea Alert!' )
  end

  def idea_accepted(contribution)
    @contribution = contribution
    mail( :to => contribution.email,
    :subject => 'Welcome to the SSM Team!' )
  end

  def sm_approval_needed(user)
    @user = user
    mail( :to => "liz@theStaySaneMom.com",
    :subject => 'Time to Approve Some Links, Lady!' )
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
