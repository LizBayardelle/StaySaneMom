require "application_system_test_case"

class GoodiesTest < ApplicationSystemTestCase
  setup do
    @goody = goodies(:one)
  end

  test "visiting the index" do
    visit goodies_url
    assert_selector "h1", text: "Goodies"
  end

  test "creating a Goody" do
    visit goodies_url
    click_on "New Goody"

    fill_in "Active", with: @goody.active
    fill_in "Description", with: @goody.description
    fill_in "Name", with: @goody.name
    click_on "Create Goody"

    assert_text "Goody was successfully created"
    click_on "Back"
  end

  test "updating a Goody" do
    visit goodies_url
    click_on "Edit", match: :first

    fill_in "Active", with: @goody.active
    fill_in "Description", with: @goody.description
    fill_in "Name", with: @goody.name
    click_on "Update Goody"

    assert_text "Goody was successfully updated"
    click_on "Back"
  end

  test "destroying a Goody" do
    visit goodies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Goody was successfully destroyed"
  end
end
