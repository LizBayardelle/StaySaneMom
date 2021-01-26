class SortingsController < ApplicationController
  before_action :set_sorting, only: [:show]
  before_action :admin_only, only: [:index]

  def index
    @sortings = Sorting.all
  end


  def show
  end


  def new
    @sorting = Sorting.new
  end



  def create
    @sorting = Sorting.new(sorting_params)

    respond_to do |format|
      if @sorting.save
        format.html { redirect_to @sorting, notice: 'Sorting was successfully created.' }
        format.json { render :show, status: :created, location: @sorting }
      else
        format.html { render :new }
        format.json { render json: @sorting.errors, status: :unprocessable_entity }
      end
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sorting
      @sorting = Sorting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sorting_params
      params.require(:sorting).permit(:house, :marriage, :pregnancy, :babies, :toddlers, :kids, :teens, :balance, :ip, :user_id)
    end
end
