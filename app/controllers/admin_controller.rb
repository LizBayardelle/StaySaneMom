class AdminController < ApplicationController
before_action :admin_only

  def resources
    @resources = Resource.all
  end

  def store_manager
    @goodies = Goody.order(:sort).all
    @variations = Variation.order(:sort).all
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

  def admin_only
    unless current_user && current_user.admin
      redirect_to root_path, notice: 'Sorry, you have to be an admin to do that!'
    end
  end

end
