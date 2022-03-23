class CreateTerms < ActiveRecord::Migration[7.0]
  def change
    create_table :terms do |t|
      t.date :due_date
      t.float :amount
      t.string :file
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
