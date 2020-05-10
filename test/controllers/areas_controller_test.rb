require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest
  test "should get house" do
    get areas_house_url
    assert_response :success
  end

  test "should get marriage" do
    get areas_marriage_url
    assert_response :success
  end

  test "should get pregnancy" do
    get areas_pregnancy_url
    assert_response :success
  end

  test "should get babies" do
    get areas_babies_url
    assert_response :success
  end

  test "should get toddlers" do
    get areas_toddlers_url
    assert_response :success
  end

  test "should get kids" do
    get areas_kids_url
    assert_response :success
  end

  test "should get teens" do
    get areas_teens_url
    assert_response :success
  end

  test "should get balance" do
    get areas_balance_url
    assert_response :success
  end

end
