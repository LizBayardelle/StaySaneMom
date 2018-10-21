class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_variables, only: [:index, :create, :destroy, :check_task, :uncheck_task]


  def set_variables
    @user_tasks = Task.where(user_id: current_user.id)
    @one_time = Task.where(frequency: "OneTime", completed: false, user_id: current_user.id).order(:position)
    @one_time_done = Task.where(frequency: "OneTime", completed: true, user_id: current_user.id).order(:position)
    @daily = Task.where(frequency: "Daily", completed: false, user_id: current_user.id).order(:position)
    @daily_done = Task.where(frequency: "Daily", completed: true, user_id: current_user.id).order(:position)
    @weekly = Task.where(frequency: "Weekly", completed: false, user_id: current_user.id).order(:position)
    @weekly_done = Task.where(frequency: "Weekly", completed: true, user_id: current_user.id).order(:position)
    @monthly = Task.where(frequency: "Monthly", completed: false, user_id: current_user.id).order(:position)
    @monthly_done = Task.where(frequency: "Monthly", completed: true, user_id: current_user.id).order(:position)
  end

  # GET /tasks
  def index
    @create_task = Task.new
    @tasks = Task.all
  end

  def sort
    params[:task].each_with_index do |id, index|
      Task.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      respond_to do |format|
        format.js
        format.html
      end
    else
      render :new
    end
  end

  # DELETE /tasks/1
  def destroy
    if @task.destroy
        respond_to do |format|
          format.js
          format.html
      end
    else
      flash[:warning] = "Oops! Something went wrong!"
    end
  end

  def check_task
      @task = Task.find(params[:id])
      if @task.update_attributes(completed: true)
          respond_to do |format|
            format.js
            format.html
          end
      else
          redirect_to tasks_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def uncheck_task
      @task = Task.find(params[:id])
      if @task.update_attributes(completed: false)
          respond_to do |format|
            format.js
            format.html
          end
      else
          redirect_to tasks_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :frequency, :completed, :user_id)
    end
end
