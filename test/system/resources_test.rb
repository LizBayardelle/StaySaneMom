require "application_system_test_case"

class ResourcesTest < ApplicationSystemTestCase
  setup do
    @resource = resources(:one)
  end

  test "visiting the index" do
    visit resources_url
    assert_selector "h1", text: "Resources"
  end

  test "creating a Resource" do
    visit resources_url
    click_on "New Resource"

    fill_in "Active", with: @resource.active
    fill_in "Category", with: @resource.category
    fill_in "Convertkit href", with: @resource.convertkit_href
    fill_in "Cta", with: @resource.cta
    fill_in "Freebie description", with: @resource.freebie_description
    fill_in "Freebie type", with: @resource.freebie_type
    fill_in "House", with: @resource.house
    fill_in "Kids", with: @resource.kids
    fill_in "Link instead", with: @resource.link_instead
    fill_in "Link url", with: @resource.link_url
    fill_in "Self", with: @resource.self
    fill_in "Spouse", with: @resource.spouse
    fill_in "Teaser", with: @resource.teaser
    fill_in "Title", with: @resource.title
    fill_in "User", with: @resource.user_id
    click_on "Create Resource"

    assert_text "Resource was successfully created"
    click_on "Back"
  end

  test "updating a Resource" do
    visit resources_url
    click_on "Edit", match: :first

    fill_in "Active", with: @resource.active
    fill_in "Category", with: @resource.category
    fill_in "Convertkit href", with: @resource.convertkit_href
    fill_in "Cta", with: @resource.cta
    fill_in "Freebie description", with: @resource.freebie_description
    fill_in "Freebie type", with: @resource.freebie_type
    fill_in "House", with: @resource.house
    fill_in "Kids", with: @resource.kids
    fill_in "Link instead", with: @resource.link_instead
    fill_in "Link url", with: @resource.link_url
    fill_in "Self", with: @resource.self
    fill_in "Spouse", with: @resource.spouse
    fill_in "Teaser", with: @resource.teaser
    fill_in "Title", with: @resource.title
    fill_in "User", with: @resource.user_id
    click_on "Update Resource"

    assert_text "Resource was successfully updated"
    click_on "Back"
  end

  test "destroying a Resource" do
    visit resources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Resource was successfully destroyed"
  end
end
