class FreebiesController < ApplicationController
  before_action :set_freebie, only: [:show, :edit, :update, :destroy]

  # GET /freebies
  # GET /freebies.json
  def index
    @freebies = Freebie.all
    @navtimeline = false
  end

  # GET /freebies/1
  # GET /freebies/1.json
  def show
    @headernav = false
    @footer = false
  end

  # GET /freebies/new
  def new
    @freebie = Freebie.new
    @navtimeline = false
  end

  # GET /freebies/1/edit
  def edit
    @navtimeline = false
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
        if params[:freebie][:sample_image].present?
          @freebie.sample_image.attach(params[:freebie][:sample_image])
          @freebie.save
        end
        if params[:freebie][:t1_image].present?
          @freebie.t1_image.attach(params[:freebie][:t1_image])
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
        if params[:freebie][:sample_image].present?
          @freebie.sample_image.purge
          @freebie.sample_image.attach(params[:freebie][:sample_image])
          @freebie.save
        end
        if params[:freebie][:t1_image].present?
          @freebie.t1_image.purge
          @freebie.t1_image.attach(params[:freebie][:t1_image])
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
      @freebie = Freebie.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def freebie_params
      params.require(:freebie).permit(
        :name,
        :category,
        :short_description,
        :convertkit_url,
        :active,
        :image,
        :sample_image,
        :t1_image,
        :top_question,
        :main_heading,
        :main_subheading,
        :t1_short,
        :t1_name,
        :t1_title,
        :t1_long,
        :wyg1,
        :wyg2,
        :wyg3,
        :outcome,
        :outcome_2
      )
    end
end
