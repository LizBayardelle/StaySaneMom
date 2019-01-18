class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[show]

  def show
    @user = User.find(params[:id])
    @members = User.all
    if User.last.created_at >= Date.today - 7
      @new_members = User.where("created_at >= ?", Time.zone.now.beginning_of_week)
    else
      @new_members = []
    end

    @done_onetime_tasks = Task.where(user_id: current_user.id, completed: true, frequency: "OneTime")
    @onetime_tasks = Task.where(user_id: current_user.id, frequency: "OneTime")
    @done_daily_tasks = Task.where(user_id: current_user.id, completed: true, frequency: "Daily")
    @daily_tasks = Task.where(user_id: current_user.id, frequency: "Daily")
    @done_weekly_tasks = Task.where(user_id: current_user.id, completed: true, frequency: "Weekly")
    @weekly_tasks = Task.where(user_id: current_user.id, frequency: "Weekly")
    @done_monthly_tasks = Task.where(user_id: current_user.id, completed: true, frequency: "Monthly")
    @monthly_tasks = Task.where(user_id: current_user.id, frequency: "Monthly")

    @people_birthday = Person.where(user_id: current_user.id).where.not(birthday: nil).sort_by{ |b| [b.birthday.month, b.birthday.day]}.first(5)

    @occasions = Occasion.where(user_id: current_user.id).where("date > ?", Time.now).order("date ASC")
    @gifts = Gift.where(user_id: current_user.id, purchased: false)

    @comments = Comment.where.not(blog_id: nil)
    @new_comments = Comment.where("created_at >= ?", Time.zone.now.beginning_of_week).where.not(blog_id: nil)
    @contributions = Contribution.where(responded: false, archived: false)
    @client = Convertkit::Client.new
    @subscribers = @client.subscribers.body
  end

  def index
    @users = User.all
    @client = Convertkit::Client.new
    @subscribers = @client.subscribers.body
    @sequences = @client.sequences.body['courses']
    @tags = @client.tags.body['tags']
  end

  def approve_contributor
    @user = User.find(params[:id])
    if @user.update_attributes(contributor: true)
        redirect_to users_path
        flash[:notice] = "That user is now a contributor!"
    else
        redirect_to users_path
        flash[:warning] = "Oops! Something went wrong!"
    end
  end

  def approve_sm
    @user = User.find(params[:id])
    if @user.update_attributes(sm_approved: true)
        redirect_to users_path
        flash[:notice] = "That SM is officially legit!"
    else
        redirect_to users_path
        flash[:warning] = "Oops! Something went wrong!"
    end
  end
end
