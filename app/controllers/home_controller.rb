class HomeController < ApplicationController

  def index
    # @headernav = true
    @blogs = Blog.where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(4)
    @all_blogs = Blog.where("published_on <= ?", Date.today).where(published: true).order("published_on DESC")
    @commented_blogs = Blog.where("published_on <= ?", Date.today).where(published: true).order('comments_count DESC').limit(4)
    @recent_blogs = Blog.where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(4)
  end

  def tools
  end

  def results
    query = params[:q].presence || "*"
    @blogs = Blog.where("published_on <= ?", Date.today).where(published: true).order('published_on DESC').search(query, suggest: true)
  end

  def allblogs
    @blogs = Blog.where(published: true).order('created_at DESC')
  end

  def house
    @all_house_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC")
    @recent_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @commented_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
    @subcategories = Subcategory.where(category: "House")
  end

  def spouse
    @all_spouse_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @commented_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
    @subcategories = Subcategory.where(category: "Spouse")
  end

  def kids
    @all_kids_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @commented_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
    @subcategories = Subcategory.where(category: "Kids")
  end

  def self
    @all_self_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @commented_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
    @subcategories = Subcategory.where(category: "Self")

  end
end
