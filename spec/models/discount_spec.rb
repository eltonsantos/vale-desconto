require 'rails_helper'

RSpec.describe Discount, type: :model do
  let(:user) { User.create(email: 'test@test.com', password: '123456') }
  let(:product) { Product.create(title: 'Product', description: 'Product description', price: 100) }
  let(:discount) { Discount.new(name: 'Discount', description: 'Discount description', discount_type: :percentual, discount_percentage: 10, activation_date: "2024-06-01 17:34:00",deactivation_date: "2024-06-09 17:34:00", user: user, product: product) }

  it "is valid with valid attributes" do
    expect(discount).to be_valid
  end

  it "is invalid without a name" do
    discount.name = nil
    expect(discount).to_not be_valid
  end

  it "belongs to a user and a product" do
    expect(discount.user).to eq(user)
    expect(discount.product).to eq(product)
  end
end