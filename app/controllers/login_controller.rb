class LoginController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :require_login, only: [:dashboard]

  def new
    # Lógica para mostrar la página de login
  end

  def create
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path # Redirigir al dashboard después de iniciar sesión
    else
      flash.now[:alert] = 'Credenciales inválidas'
      render :new
    end
  end

  def dashboard
    # Cargar datos específicos para el dashboard
    @categories = Category.all
    @inventory_transactions = InventoryTransaction.all
    @products = Product.all
    @suppliers = Supplier.all
  end

  def destroy
    session[:user_id] = nil    # Eliminar la sesión actual del usuario
    redirect_to login_path, notice: "Has cerrado sesión correctamente." # Redirigir a la página de login
  end

  private

  def set_user
    @user = User.find_by(username: params[:username]) # Cambiado de email a username
  end

  def require_login
    redirect_to login_path unless session[:user_id]
  end
end