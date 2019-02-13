require "application_system_test_case"

class CapsuleItemsTest < ApplicationSystemTestCase
  setup do
    @capsule_item = capsule_items(:one)
  end

  test "visiting the index" do
    visit capsule_items_url
    assert_selector "h1", text: "Capsule Items"
  end

  test "creating a Capsule item" do
    visit capsule_items_url
    click_on "New Capsule Item"

    fill_in "Capsule", with: @capsule_item.capsule_id
    fill_in "Caption", with: @capsule_item.caption
    fill_in "Item date", with: @capsule_item.item_date
    fill_in "Photo", with: @capsule_item.photo
    fill_in "Title", with: @capsule_item.title
    fill_in "User", with: @capsule_item.user_id
    click_on "Create Capsule item"

    assert_text "Capsule item was successfully created"
    click_on "Back"
  end

  test "updating a Capsule item" do
    visit capsule_items_url
    click_on "Edit", match: :first

    fill_in "Capsule", with: @capsule_item.capsule_id
    fill_in "Caption", with: @capsule_item.caption
    fill_in "Item date", with: @capsule_item.item_date
    fill_in "Photo", with: @capsule_item.photo
    fill_in "Title", with: @capsule_item.title
    fill_in "User", with: @capsule_item.user_id
    click_on "Update Capsule item"

    assert_text "Capsule item was successfully updated"
    click_on "Back"
  end

  test "destroying a Capsule item" do
    visit capsule_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Capsule item was successfully destroyed"
  end
end
