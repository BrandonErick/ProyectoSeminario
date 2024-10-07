class CreateInventoryTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :inventory_transactions do |t|
      t.integer :product_id
      t.integer :quantity
      t.string :transaction_type
      t.datetime :date
      t.text :description

      t.timestamps
    end
  end
end
