class AddRemainsAmountToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :remains_amount, :float
  end
end
