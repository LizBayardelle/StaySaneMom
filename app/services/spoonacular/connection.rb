require 'faraday'
require 'json'

module Spoonacular
  class Connection
    BASE = 'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

    def self.api
      Faraday.new(url: BASE) do |faraday|
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
        faraday.headers['Content-Type'] = 'application/json'
        faraday.headers['X-RapidAPI-Key'] = '5be67976e4mshcf29e401e56e68bp11f33fjsn36acde44d587'
      end
    end
  end
end
