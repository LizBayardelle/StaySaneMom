require 'test_helper'

class PlannerCustomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @planner_custom = planner_customs(:one)
  end

  test "should get index" do
    get planner_customs_url
    assert_response :success
  end

  test "should get new" do
    get new_planner_custom_url
    assert_response :success
  end

  test "should create planner_custom" do
    assert_difference('PlannerCustom.count') do
      post planner_customs_url, params: { planner_custom: { adjectives: @planner_custom.adjectives, colors: @planner_custom.colors, daily: @planner_custom.daily, daily_comments: @planner_custom.daily_comments, date_ordered: @planner_custom.date_ordered, date_starting: @planner_custom.date_starting, fonts: @planner_custom.fonts, increment: @planner_custom.increment, logo: @planner_custom.logo, monthly: @planner_custom.monthly, monthly_comments: @planner_custom.monthly_comments, other_comments: @planner_custom.other_comments, personalization: @planner_custom.personalization, purchase_id: @planner_custom.purchase_id, schedule: @planner_custom.schedule, segments: @planner_custom.segments, status: @planner_custom.status, submitted: @planner_custom.submitted, tagline: @planner_custom.tagline, themes: @planner_custom.themes, time_period: @planner_custom.time_period, user_id: @planner_custom.user_id, weekly: @planner_custom.weekly, weekly_comments: @planner_custom.weekly_comments } }
    end

    assert_redirected_to planner_custom_url(PlannerCustom.last)
  end

  test "should show planner_custom" do
    get planner_custom_url(@planner_custom)
    assert_response :success
  end

  test "should get edit" do
    get edit_planner_custom_url(@planner_custom)
    assert_response :success
  end

  test "should update planner_custom" do
    patch planner_custom_url(@planner_custom), params: { planner_custom: { adjectives: @planner_custom.adjectives, colors: @planner_custom.colors, daily: @planner_custom.daily, daily_comments: @planner_custom.daily_comments, date_ordered: @planner_custom.date_ordered, date_starting: @planner_custom.date_starting, fonts: @planner_custom.fonts, increment: @planner_custom.increment, logo: @planner_custom.logo, monthly: @planner_custom.monthly, monthly_comments: @planner_custom.monthly_comments, other_comments: @planner_custom.other_comments, personalization: @planner_custom.personalization, purchase_id: @planner_custom.purchase_id, schedule: @planner_custom.schedule, segments: @planner_custom.segments, status: @planner_custom.status, submitted: @planner_custom.submitted, tagline: @planner_custom.tagline, themes: @planner_custom.themes, time_period: @planner_custom.time_period, user_id: @planner_custom.user_id, weekly: @planner_custom.weekly, weekly_comments: @planner_custom.weekly_comments } }
    assert_redirected_to planner_custom_url(@planner_custom)
  end

  test "should destroy planner_custom" do
    assert_difference('PlannerCustom.count', -1) do
      delete planner_custom_url(@planner_custom)
    end

    assert_redirected_to planner_customs_url
  end
end
