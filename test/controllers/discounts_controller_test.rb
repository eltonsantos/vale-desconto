require "test_helper"

class DiscountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discount = discounts(:one)
  end

  test "should get index" do
    get discounts_url
    assert_response :success
  end

  test "should get new" do
    get new_discount_url
    assert_response :success
  end

  test "should create discount" do
    assert_difference("Discount.count") do
      post discounts_url, params: { discount: { activation_date: @discount.activation_date, deactivation_date: @discount.deactivation_date, description: @discount.description, discount_percentage: @discount.discount_percentage, discount_type: @discount.discount_type, image: @discount.image, name: @discount.name, price: @discount.price, price_from: @discount.price_from, price_to: @discount.price_to, quantity_leve: @discount.quantity_leve, quantity_pague: @discount.quantity_pague, status: @discount.status } }
    end

    assert_redirected_to discount_url(Discount.last)
  end

  test "should show discount" do
    get discount_url(@discount)
    assert_response :success
  end

  test "should get edit" do
    get edit_discount_url(@discount)
    assert_response :success
  end

  test "should update discount" do
    patch discount_url(@discount), params: { discount: { activation_date: @discount.activation_date, deactivation_date: @discount.deactivation_date, description: @discount.description, discount_percentage: @discount.discount_percentage, discount_type: @discount.discount_type, image: @discount.image, name: @discount.name, price: @discount.price, price_from: @discount.price_from, price_to: @discount.price_to, quantity_leve: @discount.quantity_leve, quantity_pague: @discount.quantity_pague, status: @discount.status } }
    assert_redirected_to discount_url(@discount)
  end

  test "should destroy discount" do
    assert_difference("Discount.count", -1) do
      delete discount_url(@discount)
    end

    assert_redirected_to discounts_url
  end
end
