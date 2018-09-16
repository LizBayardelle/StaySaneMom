require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog = blogs(:one)
  end

  test "should get index" do
    get blogs_url
    assert_response :success
  end

  test "should get new" do
    get new_blog_url
    assert_response :success
  end

  test "should create blog" do
    assert_difference('Blog.count') do
      post blogs_url, params: { blog: { body: @blog.body, category: @blog.category, cta: @blog.cta, image: @blog.image, linked_module: @blog.linked_module, pdf: @blog.pdf, published: @blog.published, published_on: @blog.published_on, teaser: @blog.teaser, title: @blog.title, user_id: @blog.user_id } }
    end

    assert_redirected_to blog_url(Blog.last)
  end

  test "should show blog" do
    get blog_url(@blog)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_url(@blog)
    assert_response :success
  end

  test "should update blog" do
    patch blog_url(@blog), params: { blog: { body: @blog.body, category: @blog.category, cta: @blog.cta, image: @blog.image, linked_module: @blog.linked_module, pdf: @blog.pdf, published: @blog.published, published_on: @blog.published_on, teaser: @blog.teaser, title: @blog.title, user_id: @blog.user_id } }
    assert_redirected_to blog_url(@blog)
  end

  test "should destroy blog" do
    assert_difference('Blog.count', -1) do
      delete blog_url(@blog)
    end

    assert_redirected_to blogs_url
  end
end
