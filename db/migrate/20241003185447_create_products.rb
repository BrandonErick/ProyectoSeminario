class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.integer :quantity, default: 0, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.string :sku, null: false
      t.timestamps null: false
    end
  end
end
