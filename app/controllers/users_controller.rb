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


    @comments = Comment.all
    @new_comments = Comment.where("created_at >= ?", Time.zone.now.beginning_of_week)
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
end
