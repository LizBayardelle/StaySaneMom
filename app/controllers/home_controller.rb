class HomeController < ApplicationController
  def index
    @blogs = Blog.where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    @all_blogs = Blog.where("published_on <= ?", Date.today).order("published_on DESC")
    @commented_blogs = Blog.where("published_on <= ?", Date.today).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
  end

  def tools
  end

  def results
    query = params[:q].presence || "*"
    @blogs = Blog.where("published_on <= ?", Date.today).order('published_on DESC').search(query, suggest: true)
  end


  def house
    @all_house_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).order("published_on DESC")
    @recent_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    @commented_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
  end

  def spouse
    @all_spouse_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    @commented_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
  end

  def kids
    @all_kids_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    @commented_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
  end

  def self
    @all_self_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    @commented_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
  end
end
