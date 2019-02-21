class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.all
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    @meal = Meal.new
    @meal.user_id = current_user.id
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = Meal.new(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url, notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def favorite
      @meal = Meal.find(params[:id])
      if @meal.update_attributes(favorite: true)
          redirect_to meals_path
          flash[:notice] = "That meal is now a favorite!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def unfavorite
      @meal = Meal.find(params[:id])
      if @meal.update_attributes(favorite: false)
          redirect_to meals_path
          flash[:notice] = "That meal is no longer a favorite!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:title, :ready_in_minutes, :image, :gluten_free, :dairy_free, :vegetarian, :vegan, :ingredients, :instructions, :downloaded, :favorite, :user_id, :notes)
    end
end
