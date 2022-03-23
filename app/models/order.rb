class Order < ApplicationRecord
  has_many :terms, dependent: :destroy

  validates :name, :client_name, :order_date, :total_amount, presence: true
end
