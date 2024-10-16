module InventoryTransactionsHelper
  def human_readable_transaction_type(transaction_type)
    case transaction_type
    when 'IN'
      'Entrada'
    when 'OUT'
      'Salida'
    else
      transaction_type
    end
  end
end
