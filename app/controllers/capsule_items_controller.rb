class CapsuleItemsController < ApplicationController
  before_action :set_capsule_item, only: [:show, :edit, :update, :destroy]

  # GET /capsule_items
  # GET /capsule_items.json
  def index
    @capsule_items = CapsuleItem.where(user_id: current_user)
  end

  # GET /capsule_items/1
  # GET /capsule_items/1.json
  def show
  end

  # GET /capsule_items/new
  def new
    @capsule_item = CapsuleItem.new
  end

  # GET /capsule_items/1/edit
  def edit
  end

  # POST /capsule_items
  # POST /capsule_items.json
  def create
    @capsule = Capsule.find(params[:capsule_id])
    @capsule_item = @capsule.capsule_items.build(capsule_item_params)
    @capsule_item.user = current_user

    respond_to do |format|
      if @capsule_item.save
        format.html { redirect_to @capsule, notice: 'Capsule item was successfully created.' }
        format.json { render :show, status: :created, location: @capsule_item }
      else
        format.html { render :new }
        format.json { render json: @capsule_capsule_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capsule_items/1
  # PATCH/PUT /capsule_items/1.json
  def update
    respond_to do |format|
      if @capsule_item.update(capsule_item_params)
        format.html { redirect_to capsule_path(@capsule_item.capsule.id), notice: 'Capsule item was successfully updated.' }
        format.json { render :show, status: :ok, location: @capsule_item }
      else
        format.html { render :edit }
        format.json { render json: @capsule_capsule_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capsule_items/1
  # DELETE /capsule_items/1.json
  def destroy
    @capsule_item.destroy
    respond_to do |format|
      format.html { redirect_to capsule_path(@capsule_item.capsule.id), notice: 'Capsule item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capsule_item
      @capsule_item = CapsuleItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def capsule_item_params
      params.require(:capsule_item).permit(:item_date, :photo, :title, :caption, :user_id, :capsule_id)
    end
end
