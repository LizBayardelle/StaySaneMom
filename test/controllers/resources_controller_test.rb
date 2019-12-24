require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource = resources(:one)
  end

  test "should get index" do
    get resources_url
    assert_response :success
  end

  test "should get new" do
    get new_resource_url
    assert_response :success
  end

  test "should create resource" do
    assert_difference('Resource.count') do
      post resources_url, params: { resource: { active: @resource.active, category: @resource.category, convertkit_href: @resource.convertkit_href, cta: @resource.cta, freebie_description: @resource.freebie_description, freebie_type: @resource.freebie_type, house: @resource.house, kids: @resource.kids, link_instead: @resource.link_instead, link_url: @resource.link_url, self: @resource.self, spouse: @resource.spouse, teaser: @resource.teaser, title: @resource.title, user_id: @resource.user_id } }
    end

    assert_redirected_to resource_url(Resource.last)
  end

  test "should show resource" do
    get resource_url(@resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_url(@resource)
    assert_response :success
  end

  test "should update resource" do
    patch resource_url(@resource), params: { resource: { active: @resource.active, category: @resource.category, convertkit_href: @resource.convertkit_href, cta: @resource.cta, freebie_description: @resource.freebie_description, freebie_type: @resource.freebie_type, house: @resource.house, kids: @resource.kids, link_instead: @resource.link_instead, link_url: @resource.link_url, self: @resource.self, spouse: @resource.spouse, teaser: @resource.teaser, title: @resource.title, user_id: @resource.user_id } }
    assert_redirected_to resource_url(@resource)
  end

  test "should destroy resource" do
    assert_difference('Resource.count', -1) do
      delete resource_url(@resource)
    end

    assert_redirected_to resources_url
  end
end
