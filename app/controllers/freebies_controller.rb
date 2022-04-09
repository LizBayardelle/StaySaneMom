class FreebiesController < ApplicationController
  before_action :set_freebie, only: [:show, :edit, :update, :destroy]


  def index
    @freebies = Freebie.order("created_at DESC")
    @navtimeline = false
  end


  def show
    @headernav = false
    @footer = false
  end


  def new
    @freebie = Freebie.new
    @navtimeline = false
  end


  def edit
    @navtimeline = false
  end


  def create
    @freebie = Freebie.new(freebie_params)
    pin_images = params[:freebie][:pin_image]

    respond_to do |format|
      @freebie.save!
      if @freebie.save
        if params[:freebie][:image].present?
          @freebie.image.attach(params[:freebie][:image])
          @freebie.save!
        end
        if params[:freebie][:sample_image].present?
          @freebie.sample_image.attach(params[:freebie][:sample_image])
          @freebie.save!
        end
        if params[:freebie][:t1_image].present?
          @freebie.t1_image.attach(params[:freebie][:t1_image])
          @freebie.save!
        end
        if params[:freebie][:fb_share_image].present?
          @freebie.fb_share_image.purge
          @freebie.fb_share_image.attach(params[:freebie][:fb_share_image])
          @freebie.save!
        end
        if pin_images
          @freebie.pin_image.purge
          @freebie.pin_image.attach(pin_images)
        end
        format.html { redirect_to @freebie, notice: 'Freebie was successfully created.' }
        format.json { render :show, status: :created, location: @freebie }
      else
        format.html { render :new }
        format.json { render json: @freebie.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    pin_images = params[:freebie][:pin_image]

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
        if params[:freebie][:fb_share_image].present?
          @freebie.fb_share_image.purge
          @freebie.fb_share_image.attach(params[:freebie][:fb_share_image])
          @freebie.save
        end
        if pin_images
          @freebie.pin_image.purge
          @freebie.pin_image.attach(pin_images)
        end
        format.html { redirect_to @freebie, notice: 'Freebie was successfully updated.' }
        format.json { render :show, status: :ok, location: @freebie }
      else
        format.html { render :edit }
        format.json { render json: @freebie.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @freebie.destroy
    respond_to do |format|
      format.html { redirect_to freebies_url, notice: 'Freebie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_freebie
      @freebie = Freebie.friendly.find(params[:id])
    end


    def freebie_params
      params.require(:freebie).permit(
        :name,
        :category,
        :short_description,
        :convertkit_url,
        :active,
        :thrivelink,
        
        :image,
        :sample_image,
        :t1_image,
        :fb_share_image,
        :pin_image,

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
        :outcome_2,

        :ml_id,
        :ml_submit_code,
        :after_download_url,
        :ml_img_track_url,

        category_ids: [],
        subcategory_ids: []
      )
    end
end
