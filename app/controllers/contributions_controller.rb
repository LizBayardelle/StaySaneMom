class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :destroy]
  before_action :admin_only, only: [:index, :destroy]
  layout "application-alt", only: [:index]

  # GET /contributions
  # GET /contributions.json
  def index
    @contributions = Contribution.all
    @blogs = Blog.all
  end

  # GET /contributions/1
  # GET /contributions/1.json
  def show
  end

  # GET /contributions/new
  def new
    @contribution = Contribution.new
  end

  # GET /contributions/1/edit
  def edit
  end

  # POST /contributions
  # POST /contributions.json
  def create
    @contribution = Contribution.new(contribution_params)

    respond_to do |format|
      if @contribution.save
        NewGuestPostIdeaNotificationMailer.send_new_guest_post_idea_email(@contribution).deliver
        format.html { redirect_to root_path, notice: 'Your idea has been sent!  Be prepared to hear from us within 48 hours!' }
        format.json { render :show, status: :created, location: @contribution }
      else
        format.html { render :new }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contributions/1
  # DELETE /contributions/1.json
  def destroy
    @contribution.destroy
    respond_to do |format|
      format.html { redirect_to contributions_url, notice: 'Contribution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def admin_only
    unless current_user && current_user.admin
      redirect_to root_path, notice: 'Sorry, you have to be an admin to do that!'
    end
  end

  def replied_contribution
      @contribution = Contribution.find(params[:id])
      if @contribution.update_attributes(responded: true)
          respond_to do |format|
            format.html { redirect_to contributions_url, notice: "Boom!  That's now marked as responded." }
            format.json { head :no_content }
          end
      else
          redirect_to contributions_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def unreplied_contribution
      @contribution = Contribution.find(params[:id])
      if @contribution.update_attributes(responded: false)
          respond_to do |format|
            format.html { redirect_to contributions_url, notice: "Uh oh, guess you didn't reply after all." }
            format.json { head :no_content }
          end
      else
          redirect_to contributions_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contribution
      @contribution = Contribution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contribution_params
      params.require(:contribution).permit(:name, :email, :category, :idea, :blog, :prev_published, :terms, :comments, :responded, :archived)
    end
end
