class HomeController < ApplicationController
  def index
    @blogs = Blog.order("published_on DESC").limit(3)
    @all_blogs = Blog.all
  end

  def tools
  end

  def house
  end

  def spouse
  end

  def kids
  end

  def self
  end
end
