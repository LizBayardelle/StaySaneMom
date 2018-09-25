class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_only, only: [:new, :create, :update, :edit, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.where(published: true).order("published_on DESC")
    @unpublished = Blog.where(published: false)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @user = User.where(id: @blog.user_id).first
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.published
      @blog.published_on = DateTime.current
    end

    respond_to do |format|
      if @blog.save
        byebug
        @blog.image.attach(params[:image])
        @blog.pdf.attach(params[:pdf])
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
    if @blog.published && @blog.published_on == nil
      @blog.published_on = DateTime.current
    end
    if @blog.image.attached?
      @blog.image.purge
    end
    @blog.image.attach(params[:image])
    if @blog.pdf.attached?
      @blog.pdf.purge
    end
    @blog.pdf.attach(params[:pdf])
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
      params.require(:blog).permit(:title, :teaser, :body, :cta_read_more, :cta_pdf, :cta_video, :category, :linked_module, :published, :published_on, :user_id, :image, :pdf, :slug)
    end
end
