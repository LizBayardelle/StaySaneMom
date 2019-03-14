require "application_system_test_case"

class GroupingsTest < ApplicationSystemTestCase
  setup do
    @grouping = groupings(:one)
  end

  test "visiting the index" do
    visit groupings_url
    assert_selector "h1", text: "Groupings"
  end

  test "creating a Grouping" do
    visit groupings_url
    click_on "New Grouping"

    fill_in "Active", with: @grouping.active
    fill_in "Name", with: @grouping.name
    click_on "Create Grouping"

    assert_text "Grouping was successfully created"
    click_on "Back"
  end

  test "updating a Grouping" do
    visit groupings_url
    click_on "Edit", match: :first

    fill_in "Active", with: @grouping.active
    fill_in "Name", with: @grouping.name
    click_on "Update Grouping"

    assert_text "Grouping was successfully updated"
    click_on "Back"
  end

  test "destroying a Grouping" do
    visit groupings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grouping was successfully destroyed"
  end
end
