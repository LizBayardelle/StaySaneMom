class VariationsController < ApplicationController
  before_action :set_variation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]


  # GET /variations
  # GET /variations.json
  def index
    @variations = Variation.all.order("sort ASC")
  end

  # GET /variations/1
  # GET /variations/1.json
  def show
    @basket_item = current_basket.basket_items.new
  end

  # GET /variations/new
  def new
    @variation = Variation.new
  end

  # GET /variations/1/edit
  def edit
  end

  # POST /variations
  # POST /variations.json
  def create
    @variation = Variation.new(variation_params)

    respond_to do |format|
      if @variation.save
        if params[:variation][:image].present?
          @variation.image.attach(params[:variation][:image])
          @variation.save
        end
        format.html { redirect_to goody_path(@variation.goody), notice: 'Variation was successfully created.' }
        format.json { render :show, status: :created, location: @variation }
      else
        format.html { render :new }
        format.json { render json: @variation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variations/1
  # PATCH/PUT /variations/1.json
  def update
    respond_to do |format|
      if @variation.update(variation_params)
        if params[:variation][:image].present?
          @variation.image.purge
          @variation.image.attach(params[:variation][:image])
          @variation.save
        end
        format.html { redirect_to goody_path(@variation.goody), notice: 'Variation was successfully updated.' }
        format.json { render :show, status: :ok, location: @variation }
      else
        format.html { render :edit }
        format.json { render json: @variation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variations/1
  # DELETE /variations/1.json
  def destroy
    @goody = @variation.goody
    @variation.destroy
    respond_to do |format|
      format.html { redirect_to goody_path(@goody), notice: 'Variation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_image_attachment
    @variation = Variation.find(params[:id])
    @variation.images.purge
    redirect_back(fallback_location: goodies_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variation
      @variation = Variation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def variation_params
      params.require(:variation).permit(
        :sort,
        :name,
        :price,
        :subcategories,
        :short_description,
        :description,
        :active,
        :goody_id,
        :new_product,
        :hot_product,
        :custom_planner,
        :build_planner,
        :downloadable,
        :image,
        :downloadable_file
      )
    end
end
