class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false
      t.string :contact_info
      t.string :address
      t.timestamps null: false
    end
  end
end
