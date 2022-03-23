class Term < ApplicationRecord
  belongs_to :order

  validates :due_date, :amount, presence: true
end
