class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :admin_only, only: %i[new create update edit destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.where("published_on <= ?", Date.today).order('published_on DESC').paginate(:page => params[:page], :per_page => 9)
    @commented_blogs = Blog.where("published_on <= ?", Date.today).order('comments_count DESC').limit(3)
    if params[:tag]
      @blogs = Blog.where("published_on <= ?", Date.today).order('published_on DESC').tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 9)
    else
      @blogs = Blog.where("published_on <= ?", Date.today).order('published_on DESC').paginate(:page => params[:page], :per_page => 9)
    end
    @unpublished = Blog.where.not("published_on <= ?", Date.today)
    @tags = Blog.tag_counts_on(:tags)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @user = User.where(id: @blog.user_id).first
    @comment = Comment.create
    @comments = Comment.where(blog_id: @blog.id)
    if current_user
      @comment_user = current_user
    end
    @tags = Blog.tag_counts_on(:tags)
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit; end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id

    image = blog_params[:image]
    pin_images = params[:blog][:pin_image]

    respond_to do |format|
      if @blog.save
        if pin_images
          @blog.pin_image.attach(pin_images)
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
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def admin_only
    unless current_user && current_user.admin
      redirect_to root_path, notice: 'Sorry, you have to be an admin to do that!'
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    params.require(:blog)
          .permit(:title,
                  :teaser,
                  :body,
                  :cta_read_more,
                  :cta_pdf,
                  :cta_video,
                  :video_link,
                  :freebie_filename,
                  :freebie_type,
                  :freebie_description,
                  :convertkit_href,
                  :category,
                  :linked_module,
                  :data_pin_description,
                  :pin_image,
                  :published,
                  :published_on,
                  :user_id,
                  :image,
                  :pdf,
                  :slug,
                  :tag_list)
  end
end
