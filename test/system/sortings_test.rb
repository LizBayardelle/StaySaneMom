require "application_system_test_case"

class SortingsTest < ApplicationSystemTestCase
  setup do
    @sorting = sortings(:one)
  end

  test "visiting the index" do
    visit sortings_url
    assert_selector "h1", text: "Sortings"
  end

  test "creating a Sorting" do
    visit sortings_url
    click_on "New Sorting"

    fill_in "Babies", with: @sorting.babies
    fill_in "Balance", with: @sorting.balance
    fill_in "House", with: @sorting.house
    fill_in "Ip", with: @sorting.ip
    fill_in "Kids", with: @sorting.kids
    fill_in "Marriage", with: @sorting.marriage
    fill_in "Pregnancy", with: @sorting.pregnancy
    fill_in "Teens", with: @sorting.teens
    fill_in "Toddlers", with: @sorting.toddlers
    fill_in "User", with: @sorting.user_id
    click_on "Create Sorting"

    assert_text "Sorting was successfully created"
    click_on "Back"
  end

  test "updating a Sorting" do
    visit sortings_url
    click_on "Edit", match: :first

    fill_in "Babies", with: @sorting.babies
    fill_in "Balance", with: @sorting.balance
    fill_in "House", with: @sorting.house
    fill_in "Ip", with: @sorting.ip
    fill_in "Kids", with: @sorting.kids
    fill_in "Marriage", with: @sorting.marriage
    fill_in "Pregnancy", with: @sorting.pregnancy
    fill_in "Teens", with: @sorting.teens
    fill_in "Toddlers", with: @sorting.toddlers
    fill_in "User", with: @sorting.user_id
    click_on "Update Sorting"

    assert_text "Sorting was successfully updated"
    click_on "Back"
  end

  test "destroying a Sorting" do
    visit sortings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sorting was successfully destroyed"
  end
end
