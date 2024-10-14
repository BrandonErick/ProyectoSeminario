class InventoryTransaction < ApplicationRecord
  belongs_to :product  # Relación con el modelo Product

  # Validaciones adicionales (puedes ajustar según tus necesidades)
  validates :product_id, presence: true
  validates :quantity, presence: true
  validates :transaction_type, presence: true
  validates :date, presence: true
end
