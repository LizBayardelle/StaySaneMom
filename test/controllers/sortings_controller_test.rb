require 'test_helper'

class SortingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sorting = sortings(:one)
  end

  test "should get index" do
    get sortings_url
    assert_response :success
  end

  test "should get new" do
    get new_sorting_url
    assert_response :success
  end

  test "should create sorting" do
    assert_difference('Sorting.count') do
      post sortings_url, params: { sorting: { babies: @sorting.babies, balance: @sorting.balance, house: @sorting.house, ip: @sorting.ip, kids: @sorting.kids, marriage: @sorting.marriage, pregnancy: @sorting.pregnancy, teens: @sorting.teens, toddlers: @sorting.toddlers, user_id: @sorting.user_id } }
    end

    assert_redirected_to sorting_url(Sorting.last)
  end

  test "should show sorting" do
    get sorting_url(@sorting)
    assert_response :success
  end

  test "should get edit" do
    get edit_sorting_url(@sorting)
    assert_response :success
  end

  test "should update sorting" do
    patch sorting_url(@sorting), params: { sorting: { babies: @sorting.babies, balance: @sorting.balance, house: @sorting.house, ip: @sorting.ip, kids: @sorting.kids, marriage: @sorting.marriage, pregnancy: @sorting.pregnancy, teens: @sorting.teens, toddlers: @sorting.toddlers, user_id: @sorting.user_id } }
    assert_redirected_to sorting_url(@sorting)
  end

  test "should destroy sorting" do
    assert_difference('Sorting.count', -1) do
      delete sorting_url(@sorting)
    end

    assert_redirected_to sortings_url
  end
end
