# frozen_string_literal: true

require "rails_helper"

RSpec.describe(User, type: :model) do
  let(:user) { User.new(email: "test@test.com", password: "123456") }

  it "is valid with valid attributes" do
    expect(user).to(be_valid)
  end

  it "is invalid without an email" do
    user.email = nil
    expect(user).to_not(be_valid)
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user).to_not(be_valid)
  end
end
