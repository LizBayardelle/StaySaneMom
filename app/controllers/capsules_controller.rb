class CapsulesController < ApplicationController
  before_action :set_capsule, only: [:show, :edit, :update, :destroy]
  before_action :user_only

  # GET /capsules
  # GET /capsules.json
  def index
    @capsules = Capsule.where(user_id: current_user)
  end

  # GET /capsules/1
  # GET /capsules/1.json
  def show
    @new_capsule_item = CapsuleItem.new
    @items = @capsule.capsule_items.order("item_date ASC")
  end

  # GET /capsules/new
  def new
    @capsule = Capsule.new
  end

  # GET /capsules/1/edit
  def edit
  end

  # POST /capsules
  # POST /capsules.json
  def create
    @capsule = Capsule.new(capsule_params)
    @capsule.user_id = current_user.id

    respond_to do |format|
      if @capsule.save
        format.html { redirect_to @capsule, notice: 'Capsule was successfully created.' }
        format.json { render :show, status: :created, location: @capsule }
      else
        format.html { render :new }
        format.json { render json: @capsule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capsules/1
  # PATCH/PUT /capsules/1.json
  def update
    respond_to do |format|
      if @capsule.update(capsule_params)
        format.html { redirect_to @capsule, notice: 'Capsule was successfully updated.' }
        format.json { render :show, status: :ok, location: @capsule }
      else
        format.html { render :edit }
        format.json { render json: @capsule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capsules/1
  # DELETE /capsules/1.json
  def destroy
    @capsule.destroy
    respond_to do |format|
      format.html { redirect_to capsules_url, notice: 'Capsule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capsule
      @capsule = Capsule.find(params[:id])
    end

    def user_only
      unless current_user
        redirect_to main_app.static_path(:memories)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def capsule_params
      params.require(:capsule).permit(:user_id, :name, :capsule_date, :photo_orientation, :active, :reminder_email, :comments)
    end
end
