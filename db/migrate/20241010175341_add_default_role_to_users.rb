class AddDefaultRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :role, 'user' # Cambia 'user' por el valor por defecto que desees
  end
end
