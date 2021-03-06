class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :admin_or_contributor, only: %i[new create]
  before_action :admin_or_author, only: %i[update edit]
  before_action :admin_only, only: %i[destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.where(published: true).where("published_on <= ?", Date.today).order('published_on DESC').page(params[:page])
    @featured_blogs = Blog.where(published: true, featured_home: true).where("published_on <= ?", Date.today).order('published_on DESC').limit(4)
    if params[:tag]
      @blogs = Blog.where(published: true).where("published_on <= ?", Date.today).order('published_on DESC').tagged_with(params[:tag]).page(params[:page])
    else
      @blogs = Blog.where(published: true).where("published_on <= ?", Date.today).order('published_on DESC').page(params[:page])
    end
    @unpublished = Blog.where(published: false)
    @tags = Blog.tag_counts_on(:tags)
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end


  def autocomplete
    render json: Blog.search(params[:term], fields: [{title: :text_start}], limit: 10).map(&:title)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @subcategory = Subcategory.where(id: @blog.subcategory_id).first
    @user = User.where(id: @blog.user_id).first
    @response = Response.create
    if current_user
      @comment_user = current_user
    end
    @tags = Blog.tag_counts_on(:tags)
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @subcategories = Subcategory.all
  end

  # GET /blogs/1/edit
  def edit
    @subcategories = Subcategory.all
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    @subcategories = Subcategory.all

    image = blog_params[:image]
    pin_images = params[:blog][:pin_image]

    respond_to do |format|
      if @blog.save

        @blog.image.attach(params[:blog][:image])
        if pin_images
          @blog.pin_image.attach(pin_images)
        end

        if @blog.user_id != 1 && @blog.submitted
          GuestPostMailer.post_submitted(@blog).deliver
        end

        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update

    image = blog_params[:image]
    pin_images = params[:blog][:pin_image]
    @subcategories = Subcategory.all

    if pin_images
      @blog.pin_image.purge
      @blog.pin_image.attach(pin_images)
    end

    if @blog.image.attached? && blog_params[:image].present?
      @blog.image.purge
      @blog.image.attach(blog_params[:image])
    end

    if @blog.pin_image.attached? && blog_params[:pin_image].present?
      @blog.pin_image.purge
      @blog.pin_images.attach(pin_images)
    end

    if @blog.pdf.attached? && blog_params[:pdf].present?
      @blog.pdf.purge
      @blog.pdf.attach(blog_params[:pdf])
    end

    respond_to do |format|
      if @blog.update(blog_params)

        if @blog.user_id != 1 && @blog.submitted
          GuestPostMailer.post_submitted(@blog).deliver
        end

        if @blog.user_id != 1 && @blog.published
          GuestPostMailer.post_published(@blog).deliver
        end

        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogs_path, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def tagged
    if params[:tag].present?
      @blogs = Blog.where("published_on <= ?", Date.today).tagged_with(params[:tag]).order('published_on DESC')
    else
      @blogs = Blog.where("published_on <= ?", Date.today).order('published_on DESC')
    end
  end

  def approve_blog
    @blog = Blog.friendly.find(params[:id])
    if @blog.update_attributes(approved: true)
        redirect_to contributions_path
        flash[:notice] = "That blog is now approved!"
    else
        redirect_to contributions_path
        flash[:warning] = "Oops! Something went wrong!"
    end
  end

  def unsubmit_blog
    @blog = Blog.friendly.find(params[:id])
    if @blog.update_attributes(submitted: false)
        redirect_to contributions_path
        flash[:notice] = "That blog no longer submitted!"
    else
        redirect_to contributions_path
        flash[:warning] = "Oops! Something went wrong!"
    end
  end


  def update_goody
    @blog = Blog.friendly.find(params[:id])
    if @blog.update!(blog_params)
      respond_to do |format|
        format.js do
          @blog = Blog.friendly.find(params[:id])
        end
      end
    else
      format.html { render :edit }
      format.json { render json: @blog.errors, status: :unprocessable_entity }
    end
  end



  def toggle_category
    @blog = Blog.friendly.find(params[:id])
    case params[:category]
    when "house"
      @blog.house = params[:value]
    when "marriage"
      @blog.marriage = params[:value]
    when "pregnancy"
      @blog.pregnancy = params[:value]
    when "babies"
      @blog.babies = params[:value]
    when "toddlers"
      @blog.toddlers = params[:value]
    when "kids"
      @blog.kids = params[:value]
    when "teens"
      @blog.teens = params[:value]
    when "balance"
      @blog.balance = params[:value]
    end
    if @blog.save
      respond_to do |format|
        format.js do
          @blog = Blog.friendly.find(params[:id])
        end
      end
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    params.require(:blog)
          .permit(:title,
                  :teaser,
                  :body,
                  :featured_home,
                  :featured_category,
                  :cta_read_more,
                  :cta_pdf,
                  :cta_video,
                  :video_link,
                  :freebie_filename,
                  :freebie_type,
                  :freebie_description,
                  :convertkit_href,

                  :pillar,
                  :category,
                  :house,
                  :marriage,
                  :pregnancy,
                  :babies,
                  :toddlers,
                  :kids,
                  :teens,
                  :balance,

                  :subcategory_id,
                  :linked_module,

                  :data_pin_description,
                  :pin_image,

                  :published,
                  :published_on,

                  :user_id,
                  :affiliate_links,
                  :image,
                  :photo_url,
                  :photo_external,
                  :pdf,
                  :slug,
                  :comments_count,
                  :approved,
                  :submitted,
                  :tag_list,
                  :freebie_id
                )
  end
end
