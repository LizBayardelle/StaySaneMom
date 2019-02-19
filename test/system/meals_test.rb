require "application_system_test_case"

class MealsTest < ApplicationSystemTestCase
  setup do
    @meal = meals(:one)
  end

  test "visiting the index" do
    visit meals_url
    assert_selector "h1", text: "Meals"
  end

  test "creating a Meal" do
    visit meals_url
    click_on "New Meal"

    fill_in "Dairy free", with: @meal.dairy_free
    fill_in "Downloaded", with: @meal.downloaded
    fill_in "Favorite", with: @meal.favorite
    fill_in "Gluten free", with: @meal.gluten_free
    fill_in "Image", with: @meal.image
    fill_in "Ingredients", with: @meal.ingredients
    fill_in "Instructions", with: @meal.instructions
    fill_in "Notes", with: @meal.notes
    fill_in "Ready in minutes", with: @meal.ready_in_minutes
    fill_in "Title", with: @meal.title
    fill_in "User id", with: @meal.user_id_id
    fill_in "Vegan", with: @meal.vegan
    fill_in "Vegetarian", with: @meal.vegetarian
    click_on "Create Meal"

    assert_text "Meal was successfully created"
    click_on "Back"
  end

  test "updating a Meal" do
    visit meals_url
    click_on "Edit", match: :first

    fill_in "Dairy free", with: @meal.dairy_free
    fill_in "Downloaded", with: @meal.downloaded
    fill_in "Favorite", with: @meal.favorite
    fill_in "Gluten free", with: @meal.gluten_free
    fill_in "Image", with: @meal.image
    fill_in "Ingredients", with: @meal.ingredients
    fill_in "Instructions", with: @meal.instructions
    fill_in "Notes", with: @meal.notes
    fill_in "Ready in minutes", with: @meal.ready_in_minutes
    fill_in "Title", with: @meal.title
    fill_in "User id", with: @meal.user_id_id
    fill_in "Vegan", with: @meal.vegan
    fill_in "Vegetarian", with: @meal.vegetarian
    click_on "Update Meal"

    assert_text "Meal was successfully updated"
    click_on "Back"
  end

  test "destroying a Meal" do
    visit meals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meal was successfully destroyed"
  end
end
