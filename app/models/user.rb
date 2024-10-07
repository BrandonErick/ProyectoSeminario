class User < ApplicationRecord
  has_secure_password
  # Asegúrate de que el modelo tenga el atributo 'password_digest'
end
