require 'test_helper'

class CapsuleItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @capsule_item = capsule_items(:one)
  end

  test "should get index" do
    get capsule_items_url
    assert_response :success
  end

  test "should get new" do
    get new_capsule_item_url
    assert_response :success
  end

  test "should create capsule_item" do
    assert_difference('CapsuleItem.count') do
      post capsule_items_url, params: { capsule_item: { capsule_id: @capsule_item.capsule_id, caption: @capsule_item.caption, item_date: @capsule_item.item_date, photo: @capsule_item.photo, title: @capsule_item.title, user_id: @capsule_item.user_id } }
    end

    assert_redirected_to capsule_item_url(CapsuleItem.last)
  end

  test "should show capsule_item" do
    get capsule_item_url(@capsule_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_capsule_item_url(@capsule_item)
    assert_response :success
  end

  test "should update capsule_item" do
    patch capsule_item_url(@capsule_item), params: { capsule_item: { capsule_id: @capsule_item.capsule_id, caption: @capsule_item.caption, item_date: @capsule_item.item_date, photo: @capsule_item.photo, title: @capsule_item.title, user_id: @capsule_item.user_id } }
    assert_redirected_to capsule_item_url(@capsule_item)
  end

  test "should destroy capsule_item" do
    assert_difference('CapsuleItem.count', -1) do
      delete capsule_item_url(@capsule_item)
    end

    assert_redirected_to capsule_items_url
  end
end
