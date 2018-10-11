class HomeController < ApplicationController
  def index
    @blogs = Blog.where(published: true).order("published_on DESC").limit(3)
    @all_blogs = Blog.where(published: true)
  end

  def tools
  end

  def house
    @all_house_blogs = Blog.where(category: "House", published: true).order("published_on DESC")
    @recent_blogs = Blog.where(category: "House", published: true).order("published_on DESC").limit(3)
    if params[:tag]
      @recent_blogs = Blog.where(category: "House", published: true).order("published_on DESC").tagged_with(params[:tag])
      @other_blogs = Blog.where(category: "House", published: true).order("published_on DESC").tagged_with(params[:tag]).all[1..-3]
    else
      @recent_blogs = Blog.where(category: "House", published: true).order("published_on DESC").limit(3)
      @other_blogs = Blog.where(category: "House", published: true).order("published_on DESC").all[1..-3]
    end
    @tags = Blog.tag_counts_on(:tags)
  end

  def spouse
    @all_spouse_blogs = Blog.where(category: "Spouse", published: true).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Spouse", published: true).order("published_on DESC").limit(3)
    if params[:tag]
      @recent_blogs = Blog.where(category: "Spouse", published: true).order("published_on DESC").tagged_with(params[:tag])
      @other_blogs = Blog.where(category: "Spouse", published: true).order("published_on DESC").tagged_with(params[:tag]).all[1..-3]
    else
      @recent_blogs = Blog.where(category: "Spouse", published: true).order("published_on DESC").limit(3)
      @other_blogs = Blog.where(category: "Spouse", published: true).order("published_on DESC").all[1..-3]
    end
    @tags = Blog.tag_counts_on(:tags)
  end

  def kids
    @all_kids_blogs = Blog.where(category: "Kids", published: true).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Kids", published: true).order("published_on DESC").limit(3)
    if params[:tag]
      @recent_blogs = Blog.where(category: "Kids", published: true).order("published_on DESC").tagged_with(params[:tag])
      @other_blogs = Blog.where(category: "Kids", published: true).order("published_on DESC").tagged_with(params[:tag]).all[1..-3]
    else
      @recent_blogs = Blog.where(category: "Kids", published: true).order("published_on DESC").limit(3)
      @other_blogs = Blog.where(category: "Kids", published: true).order("published_on DESC").all[1..-3]
    end
    @tags = Blog.tag_counts_on(:tags)
  end

  def self
    @all_self_blogs = Blog.where(category: "Self", published: true).order("published_on DESC")
    @recent_blogs = Blog.where(category: "Self", published: true).order("published_on DESC").limit(3)
    if params[:tag]
      @recent_blogs = Blog.where(category: "Self", published: true).order("published_on DESC").tagged_with(params[:tag])
      @other_blogs = Blog.where(category: "Self", published: true).order("published_on DESC").tagged_with(params[:tag]).all[1..-3]
    else
      @recent_blogs = Blog.where(category: "Self", published: true).order("published_on DESC").limit(3)
      @other_blogs = Blog.where(category: "Self", published: true).order("published_on DESC").all[1..-3]
    end
    @tags = Blog.tag_counts_on(:tags)
  end
end
