json.extract! inventory_transaction, :id, :product_id, :quantity, :transaction_type, :date, :description, :created_at, :updated_at
json.url inventory_transaction_url(inventory_transaction, format: :json)
