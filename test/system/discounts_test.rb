require "application_system_test_case"

class DiscountsTest < ApplicationSystemTestCase
  setup do
    @discount = discounts(:one)
  end

  test "visiting the index" do
    visit discounts_url
    assert_selector "h1", text: "Discounts"
  end

  test "should create discount" do
    visit discounts_url
    click_on "New discount"

    fill_in "Activation date", with: @discount.activation_date
    fill_in "Deactivation date", with: @discount.deactivation_date
    fill_in "Description", with: @discount.description
    fill_in "Discount percentage", with: @discount.discount_percentage
    fill_in "Discount type", with: @discount.discount_type
    fill_in "Image", with: @discount.image
    fill_in "Name", with: @discount.name
    fill_in "Price", with: @discount.price
    fill_in "Price from", with: @discount.price_from
    fill_in "Price leve", with: @discount.price_leve
    fill_in "Price pague", with: @discount.price_pague
    fill_in "Price to", with: @discount.price_to
    check "Status" if @discount.status
    fill_in "Store", with: @discount.store
    click_on "Create Discount"

    assert_text "Discount was successfully created"
    click_on "Back"
  end

  test "should update Discount" do
    visit discount_url(@discount)
    click_on "Edit this discount", match: :first

    fill_in "Activation date", with: @discount.activation_date
    fill_in "Deactivation date", with: @discount.deactivation_date
    fill_in "Description", with: @discount.description
    fill_in "Discount percentage", with: @discount.discount_percentage
    fill_in "Discount type", with: @discount.discount_type
    fill_in "Image", with: @discount.image
    fill_in "Name", with: @discount.name
    fill_in "Price", with: @discount.price
    fill_in "Price from", with: @discount.price_from
    fill_in "Price leve", with: @discount.price_leve
    fill_in "Price pague", with: @discount.price_pague
    fill_in "Price to", with: @discount.price_to
    check "Status" if @discount.status
    fill_in "Store", with: @discount.store
    click_on "Update Discount"

    assert_text "Discount was successfully updated"
    click_on "Back"
  end

  test "should destroy Discount" do
    visit discount_url(@discount)
    click_on "Destroy this discount", match: :first

    assert_text "Discount was successfully destroyed"
  end
end
