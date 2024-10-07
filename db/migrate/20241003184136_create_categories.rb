class CreateInventoryTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_transactions do |t|
      t.integer :product_id, null: false  
      t.integer :quantity, null: false
      t.string :transaction_type, null: false
      t.datetime :date, null: false
      t.text :description
      t.timestamps null: false
    end

    add_index :inventory_transactions, :product_id, name: "index_inventory_transactions_on_product_id"
  end
end
