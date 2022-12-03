class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :admin_only, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @members = User.all
    if User.last.created_at >= Date.today - 7
      @new_members = User.where("created_at >= ?", Time.zone.now.beginning_of_week)
    else
      @new_members = []
    end

    @done_onetime_tasks = Task.where(user_id: @user.id, completed: true, frequency: "OneTime")
    @onetime_tasks = Task.where(user_id: @user.id, frequency: "OneTime")
    @done_daily_tasks = Task.where(user_id: @user.id, completed: true, frequency: "Daily")
    @daily_tasks = Task.where(user_id: @user.id, frequency: "Daily")
    @done_weekly_tasks = Task.where(user_id: @user.id, completed: true, frequency: "Weekly")
    @weekly_tasks = Task.where(user_id: @user.id, frequency: "Weekly")
    @done_monthly_tasks = Task.where(user_id: @user.id, completed: true, frequency: "Monthly")
    @monthly_tasks = Task.where(user_id: @user.id, frequency: "Monthly")

    @people_birthday = Person.where(user_id: @user.id).where.not(birthday: nil).sort_by{ |b| [b.birthday.month, b.birthday.day]}.first(5)

    @occasions = Occasion.where(user_id: @user.id).where("date > ?", Time.now).order("date ASC")
    @gifts = Gift.where(user_id: @user.id, purchased: false)

    @contributions = Contribution.where(responded: false, archived: false)
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to  admin_users_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
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


  def make_contributor
    @user = User.find(params[:id])
    if @user.update_attributes(contributor: true)
      redirect_back(fallback_location: admin_users_path)
      flash[:notice] = "That user is now a contributor!"
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

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :current_password,
      :admin,
      :subscribed,
      :avatar,
      :tagline,
      :bio,
      :website_name,
      :website_url,
      :sm_youtube,
      :sm_email,
      :sm_facebook,
      :sm_pinterest,
      :sm_instagram,
      :sm_twitter,
      :sm_other,
      :sm_youtube,
      :sm_email,
      :contributor,
      :contributor_request,
      :sm_approved,
      :sm_needs_approval,
      :source
    )
  end
end
