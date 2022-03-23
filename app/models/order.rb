class Order < ApplicationRecord
  has_many :terms, dependent: :destroy

  accepts_nested_attributes_for :terms

  validates :name, :client_name, :order_date, :total_amount, presence: true
end
