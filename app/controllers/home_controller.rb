class HomeController < ApplicationController
  def index
    @blogs = Blog.where(published: true).order("published_on DESC").limit(3)
    @all_blogs = Blog.where(published: true)
  end

  def tools
  end

  def house
    @all_house_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).order("published_on DESC")
    @recent_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    if params[:tag]
      @recent_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).order("published_on DESC").tagged_with(params[:tag])
      @other_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).order("published_on DESC").tagged_with(params[:tag]).offset(3).all
    else
      @recent_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
      @other_blogs = Blog.where(category: "House").where("published_on <= ?", Date.today).order("published_on DESC").offset(3).all
    end
    @tags = Blog.tag_counts_on(:tags)
  end

  def spouse
    @all_spouse_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    if params[:tag]
      @recent_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).order("published_on DESC").tagged_with(params[:tag])
      @other_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).order("published_on DESC").tagged_with(params[:tag]).offset(3).all
    else
      @recent_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
      @other_blogs = Blog.where(category: "Spouse").where("published_on <= ?", Date.today).order("published_on DESC").offset(3).all
    end
    @tags = Blog.tag_counts_on(:tags)
  end

  def kids
    @all_kids_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    if params[:tag]
      @recent_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).order("published_on DESC").tagged_with(params[:tag])
      @other_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).order("published_on DESC").tagged_with(params[:tag]).offset(3).all
    else
      @recent_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
      @other_blogs = Blog.where(category: "Kids").where("published_on <= ?", Date.today).order("published_on DESC").offset(3).all
    end
    @tags = Blog.tag_counts_on(:tags)
  end

  def self
    @all_self_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
    if params[:tag]
      @recent_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).order("published_on DESC").tagged_with(params[:tag])
      @other_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).order("published_on DESC").tagged_with(params[:tag]).offset(3).all
    else
      @recent_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).order("published_on DESC").limit(3)
      @other_blogs = Blog.where(category: "Self").where("published_on <= ?", Date.today).order("published_on DESC").offset(3).all
    end
    @tags = Blog.tag_counts_on(:tags)
  end
end
