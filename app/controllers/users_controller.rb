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
  end

  def index
    @users = User.all
  end
end
