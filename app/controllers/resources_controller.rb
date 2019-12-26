class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]



  def index
    @resources = Resource.where(active: true)
    @house = Resource.where(active: true, house: true)
    @spouse = Resource.where(active: true, spouse: true)
    @kids = Resource.where(active: true, kids: true)
    @self = Resource.where(active: true, self: true)
  end



  def show
    @subcategories = []
    @resource.subcategory_ids.each do |id|
      @subcategories << Subcategory.find(id)
    end
  end



  def new
    @resource = Resource.new
  end



  def edit
  end



  def create
    @resource = Resource.new(resource_params)
    @resource.user_id = current_user.id
    @resource.document.attach(params[:resource][:document])
    @resource.sample.attach(params[:resource][:sample])

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(
        :user_id,
        :title,
        :teaser,
        :freebie_type,
        :freebie_description,
        :cta,
        :convertkit_href,
        :link_instead,
        :link_url,
        :house,
        :spouse,
        :kids,
        :self,
        :active,
        :sample,
        :document,
        subcategory_ids: [],
      )
    end
end
