require "application_system_test_case"

class PrintablesTest < ApplicationSystemTestCase
  setup do
    @printable = printables(:one)
  end

  test "visiting the index" do
    visit printables_url
    assert_selector "h1", text: "Printables"
  end

  test "creating a Printable" do
    visit printables_url
    click_on "New Printable"

    check "Active" if @printable.active
    check "Babies" if @printable.babies
    check "Balance" if @printable.balance
    fill_in "Description", with: @printable.description
    check "House" if @printable.house
    check "Kids" if @printable.kids
    fill_in "Link", with: @printable.link
    check "Marriage" if @printable.marriage
    fill_in "Name", with: @printable.name
    check "Pregnancy" if @printable.pregnancy
    fill_in "Price", with: @printable.price
    check "Teens" if @printable.teens
    check "Toddlers" if @printable.toddlers
    click_on "Create Printable"

    assert_text "Printable was successfully created"
    click_on "Back"
  end

  test "updating a Printable" do
    visit printables_url
    click_on "Edit", match: :first

    check "Active" if @printable.active
    check "Babies" if @printable.babies
    check "Balance" if @printable.balance
    fill_in "Description", with: @printable.description
    check "House" if @printable.house
    check "Kids" if @printable.kids
    fill_in "Link", with: @printable.link
    check "Marriage" if @printable.marriage
    fill_in "Name", with: @printable.name
    check "Pregnancy" if @printable.pregnancy
    fill_in "Price", with: @printable.price
    check "Teens" if @printable.teens
    check "Toddlers" if @printable.toddlers
    click_on "Update Printable"

    assert_text "Printable was successfully updated"
    click_on "Back"
  end

  test "destroying a Printable" do
    visit printables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Printable was successfully destroyed"
  end
end
