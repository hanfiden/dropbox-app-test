class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :client_name
      t.date :order_date
      t.float :total_amount

      t.timestamps
    end
  end
end
