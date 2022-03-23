class Order < ApplicationRecord
  has_many :terms, dependent: :destroy
end
