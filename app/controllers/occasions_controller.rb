class OccasionsController < ApplicationController
  before_action :set_occasion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /occasions
  # GET /occasions.json
  def index
    @occasions = Occasion.where(user_id: current_user.id).where("date > ?", Time.now).order("date ASC")
    @occasion = Occasion.new
    @gifts = Gift.where(user_id: current_user.id)
    @past_occasions = Occasion.where(user_id: current_user.id).where("date < ?", Time.now).order("date DESC")
  end

  # GET /occasions/1
  # GET /occasions/1.json
  def show
  end

  # GET /occasions/new
  def new
    @occasion = Occasion.new
  end

  # GET /occasions/1/edit
  def edit
  end

  # POST /occasions
  # POST /occasions.json
  def create
    @occasion = Occasion.new(occasion_params)
    @occasion.user_id = current_user.id

    respond_to do |format|
      if @occasion.save!
        format.html { redirect_to occasions_url, notice: 'Occasion was successfully created.' }
        format.json { render :show, status: :created, location: @occasion }
      else
        format.html { render :new }
        format.json { render json: @occasion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /occasions/1
  # PATCH/PUT /occasions/1.json
  def update
    @occasion.user_id = current_user.id
    respond_to do |format|
      if @occasion.update(occasion_params)
        format.html { redirect_to occasions_url, notice: 'Occasion was successfully updated.' }
        format.json { render :show, status: :ok, location: @occasion }
      else
        format.html { render :edit }
        format.json { render json: @occasion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occasions/1
  # DELETE /occasions/1.json
  def destroy
    @occasion.destroy
    respond_to do |format|
      format.html { redirect_to occasions_url, notice: 'Occasion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occasion
      @occasion = Occasion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def occasion_params
      params.require(:occasion).permit(:user_id, :name, :date, :notes, person_ids: [])
    end
end
