require "application_system_test_case"

class FreebiesTest < ApplicationSystemTestCase
  setup do
    @freebie = freebies(:one)
  end

  test "visiting the index" do
    visit freebies_url
    assert_selector "h1", text: "Freebies"
  end

  test "creating a Freebie" do
    visit freebies_url
    click_on "New Freebie"

    check "Active" if @freebie.active
    fill_in "Convertkit url", with: @freebie.convertkit_url
    fill_in "Name", with: @freebie.name
    fill_in "Short description", with: @freebie.short_description
    click_on "Create Freebie"

    assert_text "Freebie was successfully created"
    click_on "Back"
  end

  test "updating a Freebie" do
    visit freebies_url
    click_on "Edit", match: :first

    check "Active" if @freebie.active
    fill_in "Convertkit url", with: @freebie.convertkit_url
    fill_in "Name", with: @freebie.name
    fill_in "Short description", with: @freebie.short_description
    click_on "Update Freebie"

    assert_text "Freebie was successfully updated"
    click_on "Back"
  end

  test "destroying a Freebie" do
    visit freebies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Freebie was successfully destroyed"
  end
end
