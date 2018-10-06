require "application_system_test_case"

class OccasionsTest < ApplicationSystemTestCase
  setup do
    @occasion = occasions(:one)
  end

  test "visiting the index" do
    visit occasions_url
    assert_selector "h1", text: "Occasions"
  end

  test "creating a Occasion" do
    visit occasions_url
    click_on "New Occasion"

    fill_in "Date", with: @occasion.date
    fill_in "Name", with: @occasion.name
    fill_in "Notes", with: @occasion.notes
    fill_in "Person", with: @occasion.person_id
    fill_in "User", with: @occasion.user_id
    click_on "Create Occasion"

    assert_text "Occasion was successfully created"
    click_on "Back"
  end

  test "updating a Occasion" do
    visit occasions_url
    click_on "Edit", match: :first

    fill_in "Date", with: @occasion.date
    fill_in "Name", with: @occasion.name
    fill_in "Notes", with: @occasion.notes
    fill_in "Person", with: @occasion.person_id
    fill_in "User", with: @occasion.user_id
    click_on "Update Occasion"

    assert_text "Occasion was successfully updated"
    click_on "Back"
  end

  test "destroying a Occasion" do
    visit occasions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Occasion was successfully destroyed"
  end
end
