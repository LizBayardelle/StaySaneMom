require 'test_helper'

class MealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal = meals(:one)
  end

  test "should get index" do
    get meals_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_url
    assert_response :success
  end

  test "should create meal" do
    assert_difference('Meal.count') do
      post meals_url, params: { meal: { dairy_free: @meal.dairy_free, downloaded: @meal.downloaded, favorite: @meal.favorite, gluten_free: @meal.gluten_free, image: @meal.image, ingredients: @meal.ingredients, instructions: @meal.instructions, notes: @meal.notes, ready_in_minutes: @meal.ready_in_minutes, title: @meal.title, user_id_id: @meal.user_id_id, vegan: @meal.vegan, vegetarian: @meal.vegetarian } }
    end

    assert_redirected_to meal_url(Meal.last)
  end

  test "should show meal" do
    get meal_url(@meal)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_url(@meal)
    assert_response :success
  end

  test "should update meal" do
    patch meal_url(@meal), params: { meal: { dairy_free: @meal.dairy_free, downloaded: @meal.downloaded, favorite: @meal.favorite, gluten_free: @meal.gluten_free, image: @meal.image, ingredients: @meal.ingredients, instructions: @meal.instructions, notes: @meal.notes, ready_in_minutes: @meal.ready_in_minutes, title: @meal.title, user_id_id: @meal.user_id_id, vegan: @meal.vegan, vegetarian: @meal.vegetarian } }
    assert_redirected_to meal_url(@meal)
  end

  test "should destroy meal" do
    assert_difference('Meal.count', -1) do
      delete meal_url(@meal)
    end

    assert_redirected_to meals_url
  end
end
