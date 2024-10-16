class InventoryTransaction < ApplicationRecord
  belongs_to :product  # Relación con el modelo Product

  # Definir constantes para tipos de transacción
  TRANSACTION_TYPES = {
    entry: "IN",   # Entrada
    exit: "OUT"    # Salida
  }

  # Validaciones
  validates :product_id, presence: true
  validates :quantity, presence: true
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES.values }
  validates :date, presence: true

  # Callback para establecer la fecha actual si no se proporciona
  before_validation :set_default_date, if: -> { date.blank? }

  private

  def set_default_date
    self.date = Date.today # Establece la fecha actual sin la hora
  end
end
