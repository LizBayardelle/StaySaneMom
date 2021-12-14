class HomeController < ApplicationController

  def old
    @blogs = Blog.where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").limit(8)
    @all_blogs = Blog.where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC")
    @featured_blogs = Blog.where(published: true, nondisplayed: false, featured_home: true).where("published_on <= ?", Date.today).order('published_on DESC').limit(4)
    @commented_blogs = Blog.where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order('comments_count DESC').limit(8)
    @recent_blogs = Blog.where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").limit(8)
    @homepageCSS = true
  end

  def index
    # @headernav = true
    @blogs = Blog.where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").limit(8)
    @all_blogs = Blog.where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC")
    @featured_blogs = Blog.where(published: true, nondisplayed: false, featured_home: true).where("published_on <= ?", Date.today).order('published_on DESC').limit(4)
    @commented_blogs = Blog.where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order('comments_count DESC').limit(8)
    @recent_blogs = Blog.where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").limit(8)
    @homepageCSS = true
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
    @blogs = Blog.where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order('published_on DESC').search(query, suggest: true)
  end

  def house
    @all_house_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC")
    @recent_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").limit(3)
    @featured_blogs = Blog.where(category: "House", published: true, nondisplayed: false, featured_category: true).where("published_on <= ?", Date.today).order('published_on DESC').limit(4)
    @commented_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
    @subcategories = Subcategory.where(category: "House")
  end

  def spouse
    @all_spouse_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").limit(3)
    @featured_blogs = Blog.where(category: "Spouse", published: true, nondisplayed: false, featured_category: true).where("published_on <= ?", Date.today).order('published_on DESC').limit(4)
    @commented_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
    @subcategories = Subcategory.where(category: "Spouse")
  end

  def kids
    @all_kids_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").limit(3)
    @featured_blogs = Blog.where(category: "Kids", published: true, nondisplayed: false, featured_category: true).where("published_on <= ?", Date.today).order('published_on DESC').limit(4)
    @commented_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
    @subcategories = Subcategory.where(category: "Kids")
  end

  def self
    @all_self_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").limit(3)
    @featured_blogs = Blog.where(category: "Self", published: true, nondisplayed: false, featured_category: true).where("published_on <= ?", Date.today).order('published_on DESC').limit(4)
    @commented_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order('comments_count DESC').limit(3)
    @recent_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").limit(3)
    @other_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).where(published: true, nondisplayed: false).order("published_on DESC").offset(3).all
    @tags = Blog.tag_counts_on(:tags)
    @subcategories = Subcategory.where(category: "Self")

  end
end
