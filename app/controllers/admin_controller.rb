class AdminController < ApplicationController
before_action :admin_only

  def dashboard
    @freebies = Freebie.all

    @categories = Category.all

    @messages = Message.all

    @blogs = Blog.where(user_id: 1, published: true).order('created_at DESC')
    @drafts = Blog.where(user_id: 1, published: false)
    @guest_blogs = Blog.where(user_id: 1).where.not(user_id: 1)
    @other_blogs = Blog.where(published: true, pillar: false, user_id: 1)

    @users = User.all
    @superusers = User.where(admin: true).or(User.where(contributor: true))
    @members = User.where(admin: false, contributor: false)
    @contributors = User.where(contributor: true)
    @preauthorizations = Preauthorization.all
    @new_preauthorization = Preauthorization.new
    @client = Convertkit::Client.new
    @subscribers = @client.subscribers.body
  end

  def freebies
    @freebies = Freebie.all
  end

  def categories
    @categories = Category.all
  end

  def messages
    @messages = Message.all
  end

  def blogs
    @blogs = Blog.where(user_id: 1, published: true).order('created_at DESC')
    @drafts = Blog.where(user_id: 1, published: false)
    @guest_blogs = Blog.where(user_id: 1).where.not(user_id: 1)
    @other_blogs = Blog.where(published: true, pillar: false, user_id: 1)
  end

  def drafts
    @blogs = Blog.where(user_id: current_user.id)
    @drafts = Blog.where(published: false)
    @guest_blogs = Blog.where.not(user_id: 1)
  end

  def users
    @users = User.all
    @superusers = User.where(admin: true).or(User.where(contributor: true))
    @members = User.where(admin: false, contributor: false)
    @contributors = User.where(contributor: true)
    @preauthorizations = Preauthorization.all
    @new_preauthorization = Preauthorization.new
    @client = Convertkit::Client.new
    @subscribers = @client.subscribers.body
  end

end
