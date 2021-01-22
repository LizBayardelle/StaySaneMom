class FreebiesController < ApplicationController
  before_action :set_freebie, only: [:show, :edit, :update, :destroy]

  # GET /freebies
  # GET /freebies.json
  def index
    @freebies = Freebie.all
  end

  # GET /freebies/1
  # GET /freebies/1.json
  def show
  end

  # GET /freebies/new
  def new
    @freebie = Freebie.new
  end

  # GET /freebies/1/edit
  def edit
  end

  # POST /freebies
  # POST /freebies.json
  def create
    @freebie = Freebie.new(freebie_params)

    respond_to do |format|
      if @freebie.save
        if params[:freebie][:image].present?
          @freebie.image.attach(params[:freebie][:image])
          @freebie.save
        end
        format.html { redirect_to @freebie, notice: 'Freebie was successfully created.' }
        format.json { render :show, status: :created, location: @freebie }
      else
        format.html { render :new }
        format.json { render json: @freebie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /freebies/1
  # PATCH/PUT /freebies/1.json
  def update
    respond_to do |format|
      if @freebie.update(freebie_params)
        if params[:freebie][:image].present?
          @freebie.image.purge
          @freebie.image.attach(params[:freebie][:image])
          @freebie.save
        end
        format.html { redirect_to @freebie, notice: 'Freebie was successfully updated.' }
        format.json { render :show, status: :ok, location: @freebie }
      else
        format.html { render :edit }
        format.json { render json: @freebie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /freebies/1
  # DELETE /freebies/1.json
  def destroy
    @freebie.destroy
    respond_to do |format|
      format.html { redirect_to freebies_url, notice: 'Freebie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_freebie
      @freebie = Freebie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def freebie_params
      params.require(:freebie).permit(
        :name,
        :short_description,
        :convertkit_url,
        :active,
        :image
      )
    end
end
