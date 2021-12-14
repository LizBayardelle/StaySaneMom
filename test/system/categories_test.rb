require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
  end

  test "visiting the index" do
    visit categories_url
    assert_selector "h1", text: "Categories"
  end

  test "creating a Category" do
    visit categories_url
    click_on "New Category"

    fill_in "Active", with: @category.active
    fill_in "Bad adjective", with: @category.bad_adjective
    fill_in "Description", with: @category.description
    fill_in "Good adjective", with: @category.good_adjective
    fill_in "Intro", with: @category.intro
    fill_in "Main photo url", with: @category.main_photo_url
    fill_in "Name", with: @category.name
    fill_in "Photo 2 url", with: @category.photo_2_url
    fill_in "Photo 3 url", with: @category.photo_3_url
    click_on "Create Category"

    assert_text "Category was successfully created"
    click_on "Back"
  end

  test "updating a Category" do
    visit categories_url
    click_on "Edit", match: :first

    fill_in "Active", with: @category.active
    fill_in "Bad adjective", with: @category.bad_adjective
    fill_in "Description", with: @category.description
    fill_in "Good adjective", with: @category.good_adjective
    fill_in "Intro", with: @category.intro
    fill_in "Main photo url", with: @category.main_photo_url
    fill_in "Name", with: @category.name
    fill_in "Photo 2 url", with: @category.photo_2_url
    fill_in "Photo 3 url", with: @category.photo_3_url
    click_on "Update Category"

    assert_text "Category was successfully updated"
    click_on "Back"
  end

  test "destroying a Category" do
    visit categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Category was successfully destroyed"
  end
end
