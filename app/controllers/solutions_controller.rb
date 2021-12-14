class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: [:index, :show]

  # GET /solutions
  # GET /solutions.json
  def index
    @solutions = Solution.all
  end

  # GET /solutions/1
  # GET /solutions/1.json
  def show
  end

  # GET /solutions/new
  def new
    @solution = category.new
  end

  # GET /solutions/1/edit
  def edit
  end

  # POST /solutions
  # POST /solutions.json
  def create
    @solution = category.new(solution_params)

    respond_to do |format|
      if @solution.save
        @solution.image.attach(params[:solution][:image])

        format.html { redirect_to solutions_path, notice: 'category was successfully created.' }
        format.json { render :show, status: :created, location: @solution }
      else
        format.html { render :new }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solutions/1
  # PATCH/PUT /solutions/1.json
  def update
    respond_to do |format|
      if @solution.update(solution_params)
        if @solution.image.attached? && solution_params[:image].present?
          @solution.image.purge
          @solution.image.attach(solution_params[:image])
        end

        format.html { redirect_to solutions_path, notice: 'solution was successfully updated.' }
        format.json { render :show, status: :ok, location: @solution }
      else
        format.html { render :edit }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
  def destroy
    @solution.destroy
    respond_to do |format|
      format.html { redirect_to solutions_url, notice: 'solution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solution
      @solution = Solution.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def solution_params
      params.require(:solution).permit(
        :name,
        :price,
        :description,
        :link,
        :thrivelink,

        :house,
        :marriage,
        :pregnancy,
        :babies,
        :toddlers,
        :kids,
        :teens,
        :balance,
        :active,
        :image,

        category_ids: []
      )
    end
end
