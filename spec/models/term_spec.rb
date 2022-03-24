require 'rails_helper'

RSpec.describe Term, type: :model do
  it "is not valid without a due_date" do
    term = Term.new(due_date: nil)
    expect(term).to_not be_valid
  end

  it "is not valid without a amount" do
    term = Term.new(amount: nil)
    expect(term).to_not be_valid
  end

  it "is not valid without a file" do
    term = Term.new(file: nil)
    expect(term).to_not be_valid
  end
end
