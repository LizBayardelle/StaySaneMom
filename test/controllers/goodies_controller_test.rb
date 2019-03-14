require 'test_helper'

class GoodiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goody = goodies(:one)
  end

  test "should get index" do
    get goodies_url
    assert_response :success
  end

  test "should get new" do
    get new_goody_url
    assert_response :success
  end

  test "should create goody" do
    assert_difference('Goody.count') do
      post goodies_url, params: { goody: { active: @goody.active, description: @goody.description, name: @goody.name } }
    end

    assert_redirected_to goody_url(Goody.last)
  end

  test "should show goody" do
    get goody_url(@goody)
    assert_response :success
  end

  test "should get edit" do
    get edit_goody_url(@goody)
    assert_response :success
  end

  test "should update goody" do
    patch goody_url(@goody), params: { goody: { active: @goody.active, description: @goody.description, name: @goody.name } }
    assert_redirected_to goody_url(@goody)
  end

  test "should destroy goody" do
    assert_difference('Goody.count', -1) do
      delete goody_url(@goody)
    end

    assert_redirected_to goodies_url
  end
end
