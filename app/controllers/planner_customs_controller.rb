class PlannerCustomsController < ApplicationController
  before_action :set_planner_custom, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, only: [:index, :delete]
  before_action :admin_or_creator, except: [:index, :new, :create]
  before_action :already_submitted, only: [:edit, :update]

  # GET /planner_customs
  # GET /planner_customs.json
  def index
    @planner_customs = PlannerCustom.all
  end

  # GET /planner_customs/1
  # GET /planner_customs/1.json
  def show
  end

  # GET /planner_customs/new
  def new
    @planner_custom = PlannerCustom.new
  end

  # GET /planner_customs/1/edit
  def edit
  end

  # POST /planner_customs
  # POST /planner_customs.json
  def create
    @planner_custom = PlannerCustom.new(planner_custom_params)

    respond_to do |format|
      if @planner_custom.save
        if @planner_custom.submitted
          format.html { redirect_to root_path, notice: "Congratulations!  You've officially submitted your design!" }
          format.json { render :show, status: :created, location: @planner_custom }
        else
          format.html { redirect_to root_path, notice: "Your design has been saved.  You can access it any time from your account page." }
          format.json { render :show, status: :created, location: @planner_custom }
        end
      else
        format.html { render :new }
        format.json { render json: @planner_custom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planner_customs/1
  # PATCH/PUT /planner_customs/1.json
  def update
    respond_to do |format|
      if @planner_custom.update(planner_custom_params)
        format.html { redirect_to @planner_custom, notice: 'Planner custom was successfully updated.' }
        format.json { render :show, status: :ok, location: @planner_custom }
      else
        format.html { render :edit }
        format.json { render json: @planner_custom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planner_customs/1
  # DELETE /planner_customs/1.json
  def destroy
    @planner_custom.destroy
    respond_to do |format|
      format.html { redirect_to planner_customs_url, notice: 'Planner custom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def already_submitted
      if current_user && !current_user.admin
        if @planner_custom.submitted
          redirect_to planner_custom_path(@planner_custom), notice: "That planner has already been submitted!  If you have an urgent issue please email liz@theStaySaneMom.com immediately."
        end
      end
    end

    def admin_or_creator
      @planner_custom = PlannerCustom.find(params[:id])
      unless (current_user && current_user.admin) || (current_user && @planner_custom.user_id == current_user.id)
        redirect_to root_path, notice: "Sorry, you don't have the permissions to do that."
      end
    end


    def admin_only
      unless current_user && current_user.admin
        redirect_to root_path, notice: 'Sorry, you have to be an admin to do that!'
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_planner_custom
      @planner_custom = PlannerCustom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planner_custom_params
      params.require(:planner_custom).permit(
        :purchase_id,
        :user_id,
        :status,
        :date_ordered,
        :date_starting,
        :time_period,
        :planner_increment,
        :monthly,
        :monthly_comments,
        :weekly,
        :weekly_comments,
        :daily,
        :daily_comments,
        :schedule,
        :segments,
        :adjectives,
        :colors,
        :fonts,
        :themes,
        :logo,
        :personalization,
        :tagline,
        :other_comments,
        :submitted,
        logos: [],
        doodles: []
      )
    end
end
