Rails.application.routes.draw do
  # Rutas para usuarios
  resources :users do
    collection do
      get :export  # Ruta para exportar usuarios a Excel
    end
  end

  # Rutas para proveedores
  resources :suppliers do
    collection do
      get :export  # Ruta para exportar proveedores a Excel
    end
  end

  # Rutas para productos
  resources :products do
    collection do
      get :export  # Ruta para exportar productos a Excel
    end
  end

  # Rutas para transacciones de inventario
  resources :inventory_transactions do
    collection do
      get :export  # Ruta para exportar transacciones de inventario a Excel
    end
  end

  # Rutas para categorías
  resources :categories do
    collection do
      get :export  # Ruta para exportar categorías a Excel
    end
  end

  # Rutas para la sesión de inicio de sesión
  get 'login', to: 'login#new', as: 'login'      # Ruta para mostrar el formulario de inicio de sesión
  post 'login', to: 'login#create'               # Ruta para manejar el inicio de sesión
  delete 'logout', to: 'login#destroy', as: 'logout'  # Ruta para cerrar sesión

  # Ruta para el dashboard después de iniciar sesión
  get 'dashboard', to: 'login#dashboard', as: 'dashboard'

  # Ruta para el registro de usuarios
  get 'signup', to: 'users#new', as: 'signup'    # Ruta para mostrar el formulario de registro
  post 'users', to: 'users#create'               # Ruta para crear un nuevo usuario

  # Ruta para comprobar el estado de la aplicación
  get 'up', to: 'rails/health#show', as: :rails_health_check

  # Define la ruta raíz de la aplicación
  root "login#new"  # Redirige a la página de inicio de sesión al cargar la aplicación
end
