module Spoonacular
  class Recipe < Base
    attr_accessor :aggregate_likes,
                  :dairy_free,
                  :gluten_free,
                  :id,
                  :image,
                  :ingredients,
                  :instructions,
                  :ready_in_minutes,
                  :title,
                  :vegan,
                  :vegetarian

    MAX_LIMIT = 12
    CACHE_DEFAULTS = { expires_in: 7.days, force: false }

    def self.all(query = {}, clear_cache)
      cache = CACHE_DEFAULTS.merge({ force: clear_cache })
      response = Spoonacular::Request.where('recipes/random', cache, query.merge({ number: 20 }))
      recipes = response.fetch('recipes', []).map { |recipe| Recipe.new(recipe) }
      [ recipes, response[:errors] ]
    end

    # response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?number=20",
    #   headers:{
    #     "X-RapidAPI-Key" => "5be67976e4mshcf29e401e56e68bp11f33fjsn36acde44d587"
    #   }

    def self.random(query = {}, clear_cache)
      cache = CACHE_DEFAULTS.merge({ force: clear_cache })
      response = Spoonacular::Request.where('recipes/random', cache, query.merge({ number: MAX_LIMIT }))
      recipes = response.fetch('recipes', []).map { |recipe| Recipe.new(recipe) }
      [ recipes, response[:errors] ]
    end

    def self.find(id)
      response = Spoonacular::Request.get("recipes/#{id}/information", CACHE_DEFAULTS)
      Recipe.new(response)
    end

    def initialize(args = {})
      super(args)
      self.ingredients = parse_ingredients(args)
      self.instructions = parse_instructions(args)
    end

    def parse_ingredients(args = {})
      args.fetch("extendedIngredients", []).map { |ingredient| Ingredient.new(ingredient) }
    end

    def parse_instructions(args = {})
      instructions = args.fetch("analyzedInstructions", [])
      if instructions.present?
        steps = instructions.first.fetch("steps", [])
        steps.map { |instruction| Instruction.new(instruction) }
      else
        []
      end
    end
  end
end
