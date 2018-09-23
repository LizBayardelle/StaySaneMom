class HomeController < ApplicationController
  def index
    @blogs = Blog.where(published: true).order("published_on DESC").limit(3)
    @all_blogs = Blog.where(published: true)
  end

  def tools
  end

  def house
    @recent_blogs = Blog.where(category: "House", published: true).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "House", published: true).order("published_on DESC").all[1..-3]
  end

  def spouse
    @recent_blogs = Blog.where(category: "Spouse", published: true).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Spouse", published: true).order("published_on DESC").all[1..-3]
  end

  def kids
    @recent_blogs = Blog.where(category: "Kids", published: true).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Kids", published: true).order("published_on DESC").all[1..-3]
  end

  def self
    @recent_blogs = Blog.where(category: "Self", published: true).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Self", published: true).order("published_on DESC").all[1..-3]
  end
end
