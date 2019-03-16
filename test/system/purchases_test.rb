require "application_system_test_case"

class PurchasesTest < ApplicationSystemTestCase
  setup do
    @purchase = purchases(:one)
  end

  test "visiting the index" do
    visit purchases_url
    assert_selector "h1", text: "Purchases"
  end

  test "creating a Purchase" do
    visit purchases_url
    click_on "New Purchase"

    fill_in "Basket", with: @purchase.basket_id
    fill_in "First name", with: @purchase.first_name
    fill_in "Last name", with: @purchase.last_name
    fill_in "Phone", with: @purchase.phone
    fill_in "Shipping 1", with: @purchase.shipping_1
    fill_in "Shipping 2", with: @purchase.shipping_2
    fill_in "Shipping city", with: @purchase.shipping_city
    fill_in "Shipping country", with: @purchase.shipping_country
    fill_in "Shipping state", with: @purchase.shipping_state
    fill_in "Shipping zip", with: @purchase.shipping_zip
    fill_in "Total", with: @purchase.total
    fill_in "User", with: @purchase.user_id
    click_on "Create Purchase"

    assert_text "Purchase was successfully created"
    click_on "Back"
  end

  test "updating a Purchase" do
    visit purchases_url
    click_on "Edit", match: :first

    fill_in "Basket", with: @purchase.basket_id
    fill_in "First name", with: @purchase.first_name
    fill_in "Last name", with: @purchase.last_name
    fill_in "Phone", with: @purchase.phone
    fill_in "Shipping 1", with: @purchase.shipping_1
    fill_in "Shipping 2", with: @purchase.shipping_2
    fill_in "Shipping city", with: @purchase.shipping_city
    fill_in "Shipping country", with: @purchase.shipping_country
    fill_in "Shipping state", with: @purchase.shipping_state
    fill_in "Shipping zip", with: @purchase.shipping_zip
    fill_in "Total", with: @purchase.total
    fill_in "User", with: @purchase.user_id
    click_on "Update Purchase"

    assert_text "Purchase was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase" do
    visit purchases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase was successfully destroyed"
  end
end
