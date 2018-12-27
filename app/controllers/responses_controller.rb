class ResponsesController < ApplicationController
  before_action :set_response, only: [:update, :destroy]
  before_action :responder_or_admin, except: [:create, :index]
  before_action :admin_only, only: [:index]

  def index
    @responses = Response.where.not(comment_id: nil).order('created_at DESC')
  end

  def create
    @comment = Comment.find(params[:comment_id])
    @response = @comment.responses.build(response_params)
    @response.user = current_user
    if @response.save
      redirect_to blog_path(@comment.blog), notice: 'Your wisdom benefits moms everywhere!  Thank you for sharing!'
    else
      redirect_to blog_path(@comment.blog), notice: 'Oops!  Your response could not be saved at this time.'
    end
  end

  def update
    if @response.update(response_params)
      redirect_to responses_path, notice: 'Your response has been successfully updated.'
    else
      redirect_to responses_path, notice: 'Oops!  Your response could not be saved at this time.'
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
    if current_user.admin
      redirect_to responses_path, notice: 'Response has been deleted.'
    else
      redirect_back fallback_location: root_path, notice: 'Response has been deleted.'
    end
  end

  def approve_response
      @response = Response.find(params[:id])
      if @response.update_attributes(approved: true)
          redirect_back fallback_location: root_path
          flash[:notice] = "That response has been approved!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def response_read
      @response = Response.find(params[:id])
      if @response.update_attributes(read: true)
          redirect_back fallback_location: root_path
          flash[:notice] = "That response has been marked read!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def response_unread
      @response = Response.find(params[:id])
      if @response.update_attributes(read: false)
          redirect_back fallback_location: root_path
          flash[:notice] = "That response has been marked unread!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end


  private
    def set_response
      @response = Response.find(params[:id])
    end

    def response_params
      params.require(:response).permit(:body, :user_id, :comment_id, :approved, :read, :email, :name)
    end

    def responder_or_admin
      @response = Response.find(params[:id])
      unless current_user == @response.user || current_user.admin
        flash[:alert] = "Sorry, you can't edit or delete someone else's response."
        redirect_to [response.post]
      end
    end

    def admin_only
      unless current_user && current_user.admin
        redirect_to root_path, notice: 'Sorry, you have to be an admin to do that!'
      end
    end

end
