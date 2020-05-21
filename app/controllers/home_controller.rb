class HomeController < ApplicationController

  def index
    # @headernav = true
    @blogs = Blog.where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(8)
    @all_blogs = Blog.where("published_on <= ?", Date.today).where(published: true).order("published_on DESC")
    @featured_blogs = Blog.where(published: true, featured_home: true).where("published_on <= ?", Date.today).order('published_on DESC').limit(4)
    @commented_blogs = Blog.where("published_on <= ?", Date.today).where(published: true).order('comments_count DESC').limit(8)
    @recent_blogs = Blog.where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(8)
  end

  def redirect
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to root_path
      flash[:notice] = "Uh oh.  Something appears to have gone wrong."
    end
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
    @featured_blogs = Blog.where(category: "House", published: true, featured_category: true).where("published_on <= ?", Date.today).order('published_on DESC').limit(4)
    @commented_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
    @subcategories = Subcategory.where(category: "House")
  end

  def spouse
    @all_spouse_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @featured_blogs = Blog.where(category: "Spouse", published: true, featured_category: true).where("published_on <= ?", Date.today).order('published_on DESC').limit(4)
    @commented_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
    @subcategories = Subcategory.where(category: "Spouse")
  end

  def kids
    @all_kids_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @featured_blogs = Blog.where(category: "Kids", published: true, featured_category: true).where("published_on <= ?", Date.today).order('published_on DESC').limit(4)
    @commented_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
    @subcategories = Subcategory.where(category: "Kids")
  end

  def self
    @all_self_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @featured_blogs = Blog.where(category: "Self", published: true, featured_category: true).where("published_on <= ?", Date.today).order('published_on DESC').limit(4)
    @commented_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
    @subcategories = Subcategory.where(category: "Self")

  end
end
