Rails.application.routes.draw do
  resources :users
  resources :suppliers
  resources :products
  resources :inventory_transactions
  resources :categories

  # Rutas para la sesión de inicio de sesión
  get 'login', to: 'login#new', as: 'login'  # Ruta para mostrar el formulario de inicio de sesión
  post 'login', to: 'login#create'           # Ruta para manejar el inicio de sesión
  
  # Ruta para el dashboard después de iniciar sesión
  get 'dashboard', to: 'login#dashboard', as: 'dashboard'  # Ruta para el dashboard

  # Ruta para cerrar sesión
  delete 'logout', to: 'login#destroy', as: 'logout'  # Ruta para cerrar sesión

  # Ruta para comprobar el estado de la aplicación
  get "up" => "rails/health#show", as: :rails_health_check

  # Define la ruta raíz de la aplicación
  root "login#new"  # Redirige a la página de inicio de sesión al cargar la aplicación
end
