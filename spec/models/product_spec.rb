require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { Product.new(title: 'Product', description: 'Product description', price: 100) }

  it "is valid with valid attributes" do
    expect(product).to be_valid
  end

  it "is invalid without a title" do
    product.title = nil
    expect(product).to_not be_valid
  end

  it "has many discounts" do
    expect(product.discounts).to be_empty
  end
end