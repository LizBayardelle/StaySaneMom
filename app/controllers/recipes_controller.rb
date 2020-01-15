class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @tag = query.fetch(:tags, 'all')
    @refresh_params = refresh_params
    query = params[:search_term]
    @recipes, @errors = Spoonacular::Recipe.all(query, clear_cache)
  end

  def show
    @recipe = Spoonacular::Recipe.find(params[:id])
    @meal = Meal.new
  end

  private
   def query
     params.permit(:query).fetch(:query, {})
   end

  def clear_cache
    params[:clear_cache].present?
  end

  def refresh_params
    refresh = { clear_cache: true }
    refresh.merge!({ query: query }) if query.present?
    refresh
  end
end
