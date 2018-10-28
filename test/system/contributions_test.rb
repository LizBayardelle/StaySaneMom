require "application_system_test_case"

class ContributionsTest < ApplicationSystemTestCase
  setup do
    @contribution = contributions(:one)
  end

  test "visiting the index" do
    visit contributions_url
    assert_selector "h1", text: "Contributions"
  end

  test "creating a Contribution" do
    visit contributions_url
    click_on "New Contribution"

    fill_in "Archived", with: @contribution.archived
    fill_in "Category", with: @contribution.category
    fill_in "Comments", with: @contribution.comments
    fill_in "Email", with: @contribution.email
    fill_in "Idea", with: @contribution.idea
    fill_in "Name", with: @contribution.name
    fill_in "Prev Published", with: @contribution.prev_published
    fill_in "Responded", with: @contribution.responded
    fill_in "Terms", with: @contribution.terms
    click_on "Create Contribution"

    assert_text "Contribution was successfully created"
    click_on "Back"
  end

  test "updating a Contribution" do
    visit contributions_url
    click_on "Edit", match: :first

    fill_in "Archived", with: @contribution.archived
    fill_in "Category", with: @contribution.category
    fill_in "Comments", with: @contribution.comments
    fill_in "Email", with: @contribution.email
    fill_in "Idea", with: @contribution.idea
    fill_in "Name", with: @contribution.name
    fill_in "Prev Published", with: @contribution.prev_published
    fill_in "Responded", with: @contribution.responded
    fill_in "Terms", with: @contribution.terms
    click_on "Update Contribution"

    assert_text "Contribution was successfully updated"
    click_on "Back"
  end

  test "destroying a Contribution" do
    visit contributions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contribution was successfully destroyed"
  end
end
