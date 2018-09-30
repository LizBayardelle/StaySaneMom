require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "creating a Person" do
    visit people_url
    click_on "New Person"

    fill_in "Anniversary", with: @person.anniversary
    fill_in "Birthday", with: @person.birthday
    fill_in "First Name", with: @person.first_name
    fill_in "Last Name", with: @person.last_name
    fill_in "Middle Name", with: @person.middle_name
    fill_in "Notes", with: @person.notes
    fill_in "Other", with: @person.other
    fill_in "Other Date Name", with: @person.other_date_name
    fill_in "Relationship", with: @person.relationship
    fill_in "User", with: @person.user_id
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "updating a Person" do
    visit people_url
    click_on "Edit", match: :first

    fill_in "Anniversary", with: @person.anniversary
    fill_in "Birthday", with: @person.birthday
    fill_in "First Name", with: @person.first_name
    fill_in "Last Name", with: @person.last_name
    fill_in "Middle Name", with: @person.middle_name
    fill_in "Notes", with: @person.notes
    fill_in "Other", with: @person.other
    fill_in "Other Date Name", with: @person.other_date_name
    fill_in "Relationship", with: @person.relationship
    fill_in "User", with: @person.user_id
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "destroying a Person" do
    visit people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person was successfully destroyed"
  end
end
