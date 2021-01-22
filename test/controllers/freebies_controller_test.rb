require 'test_helper'

class FreebiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @freebie = freebies(:one)
  end

  test "should get index" do
    get freebies_url
    assert_response :success
  end

  test "should get new" do
    get new_freebie_url
    assert_response :success
  end

  test "should create freebie" do
    assert_difference('Freebie.count') do
      post freebies_url, params: { freebie: { active: @freebie.active, convertkit_url: @freebie.convertkit_url, name: @freebie.name, short_description: @freebie.short_description } }
    end

    assert_redirected_to freebie_url(Freebie.last)
  end

  test "should show freebie" do
    get freebie_url(@freebie)
    assert_response :success
  end

  test "should get edit" do
    get edit_freebie_url(@freebie)
    assert_response :success
  end

  test "should update freebie" do
    patch freebie_url(@freebie), params: { freebie: { active: @freebie.active, convertkit_url: @freebie.convertkit_url, name: @freebie.name, short_description: @freebie.short_description } }
    assert_redirected_to freebie_url(@freebie)
  end

  test "should destroy freebie" do
    assert_difference('Freebie.count', -1) do
      delete freebie_url(@freebie)
    end

    assert_redirected_to freebies_url
  end
end
