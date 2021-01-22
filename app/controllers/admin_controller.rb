class AdminController < ApplicationController
before_action :admin_only

  def freebies
    @freebies = Freebie.all
  end

  def blogs
    @blogs = Blog.where(published: true).order('created_at DESC')
  end

  def drafts
    @blogs = Blog.where(user_id: current_user.id)
  end

  def users
    @users = User.all
    @superusers = User.where(admin: true).or(User.where(contributor: true))
    @members = User.where(admin: false, contributor: false)
    @preauthorizations = Preauthorization.all
    @new_preauthorization = Preauthorization.new
    @client = Convertkit::Client.new
    @subscribers = @client.subscribers.body
  end

end
