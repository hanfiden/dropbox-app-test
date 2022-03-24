require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is not valid without a name" do
    order = Order.new(name: nil)
    expect(order).to_not be_valid
  end

  it "is not valid without a client_name" do
    order = Order.new(client_name: nil)
    expect(order).to_not be_valid
  end

  it "is not valid without a order_date" do
    order = Order.new(order_date: nil)
    expect(order).to_not be_valid
  end

  it "is not valid without a total_amount" do
    order = Order.new(total_amount: nil)
    expect(order).to_not be_valid
  end

  it "is not valid without a remains_amount" do
    order = Order.new(remains_amount: nil)
    expect(order).to_not be_valid
  end
end
