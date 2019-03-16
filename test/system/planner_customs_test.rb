require "application_system_test_case"

class PlannerCustomsTest < ApplicationSystemTestCase
  setup do
    @planner_custom = planner_customs(:one)
  end

  test "visiting the index" do
    visit planner_customs_url
    assert_selector "h1", text: "Planner Customs"
  end

  test "creating a Planner custom" do
    visit planner_customs_url
    click_on "New Planner Custom"

    fill_in "Adjectives", with: @planner_custom.adjectives
    fill_in "Colors", with: @planner_custom.colors
    fill_in "Daily", with: @planner_custom.daily
    fill_in "Daily comments", with: @planner_custom.daily_comments
    fill_in "Date ordered", with: @planner_custom.date_ordered
    fill_in "Date starting", with: @planner_custom.date_starting
    fill_in "Fonts", with: @planner_custom.fonts
    fill_in "Increment", with: @planner_custom.increment
    fill_in "Logo", with: @planner_custom.logo
    fill_in "Monthly", with: @planner_custom.monthly
    fill_in "Monthly comments", with: @planner_custom.monthly_comments
    fill_in "Other comments", with: @planner_custom.other_comments
    fill_in "Personalization", with: @planner_custom.personalization
    fill_in "Purchase", with: @planner_custom.purchase_id
    fill_in "Schedule", with: @planner_custom.schedule
    fill_in "Segments", with: @planner_custom.segments
    fill_in "Status", with: @planner_custom.status
    fill_in "Submitted", with: @planner_custom.submitted
    fill_in "Tagline", with: @planner_custom.tagline
    fill_in "Themes", with: @planner_custom.themes
    fill_in "Time period", with: @planner_custom.time_period
    fill_in "User", with: @planner_custom.user_id
    fill_in "Weekly", with: @planner_custom.weekly
    fill_in "Weekly comments", with: @planner_custom.weekly_comments
    click_on "Create Planner custom"

    assert_text "Planner custom was successfully created"
    click_on "Back"
  end

  test "updating a Planner custom" do
    visit planner_customs_url
    click_on "Edit", match: :first

    fill_in "Adjectives", with: @planner_custom.adjectives
    fill_in "Colors", with: @planner_custom.colors
    fill_in "Daily", with: @planner_custom.daily
    fill_in "Daily comments", with: @planner_custom.daily_comments
    fill_in "Date ordered", with: @planner_custom.date_ordered
    fill_in "Date starting", with: @planner_custom.date_starting
    fill_in "Fonts", with: @planner_custom.fonts
    fill_in "Increment", with: @planner_custom.increment
    fill_in "Logo", with: @planner_custom.logo
    fill_in "Monthly", with: @planner_custom.monthly
    fill_in "Monthly comments", with: @planner_custom.monthly_comments
    fill_in "Other comments", with: @planner_custom.other_comments
    fill_in "Personalization", with: @planner_custom.personalization
    fill_in "Purchase", with: @planner_custom.purchase_id
    fill_in "Schedule", with: @planner_custom.schedule
    fill_in "Segments", with: @planner_custom.segments
    fill_in "Status", with: @planner_custom.status
    fill_in "Submitted", with: @planner_custom.submitted
    fill_in "Tagline", with: @planner_custom.tagline
    fill_in "Themes", with: @planner_custom.themes
    fill_in "Time period", with: @planner_custom.time_period
    fill_in "User", with: @planner_custom.user_id
    fill_in "Weekly", with: @planner_custom.weekly
    fill_in "Weekly comments", with: @planner_custom.weekly_comments
    click_on "Update Planner custom"

    assert_text "Planner custom was successfully updated"
    click_on "Back"
  end

  test "destroying a Planner custom" do
    visit planner_customs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Planner custom was successfully destroyed"
  end
end
