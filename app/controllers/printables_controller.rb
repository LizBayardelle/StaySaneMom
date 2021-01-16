class PrintablesController < ApplicationController
  before_action :set_printable, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: [:index, :show]

  # GET /printables
  # GET /printables.json
  def index
    @printables = Printable.all
  end

  # GET /printables/1
  # GET /printables/1.json
  def show
  end

  # GET /printables/new
  def new
    @printable = Printable.new
  end

  # GET /printables/1/edit
  def edit
  end

  # POST /printables
  # POST /printables.json
  def create
    @printable = Printable.new(printable_params)

    respond_to do |format|
      if @printable.save
        @printable.image.attach(params[:printable][:image])

        format.html { redirect_to printables_path, notice: 'Printable was successfully created.' }
        format.json { render :show, status: :created, location: @printable }
      else
        format.html { render :new }
        format.json { render json: @printable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /printables/1
  # PATCH/PUT /printables/1.json
  def update
    respond_to do |format|
      if @printable.update(printable_params)
        if @printable.image.attached? && printable_params[:image].present?
          @printable.image.purge
          @printable.image.attach(printable_params[:image])
        end

        format.html { redirect_to printables_path, notice: 'Printable was successfully updated.' }
        format.json { render :show, status: :ok, location: @printable }
      else
        format.html { render :edit }
        format.json { render json: @printable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /printables/1
  # DELETE /printables/1.json
  def destroy
    @printable.destroy
    respond_to do |format|
      format.html { redirect_to printables_url, notice: 'Printable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_printable
      @printable = Printable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def printable_params
      params.require(:printable).permit(
        :name,
        :price,
        :description,
        :link,
        :house,
        :marriage,
        :pregnancy,
        :babies,
        :toddlers,
        :kids,
        :teens,
        :balance,
        :active,
        :image
      )
    end
end
