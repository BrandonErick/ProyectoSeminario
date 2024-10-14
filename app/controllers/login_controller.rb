class LoginController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :require_login, only: [:dashboard]

  def new
    @user = User.new # Inicializa un nuevo objeto de usuario para el registro
  end

  def create
    # Maneja el registro de usuario
    if params[:action] == "signup" # Verifica si es la acción de registro
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "Registro exitoso. Puedes iniciar sesión ahora."
        redirect_to login_path # Redirige a la página de inicio de sesión
      else
        flash.now[:alert] = @user.errors.full_messages.to_sentence # Muestra los errores
        render :new # Renderiza de nuevo la página de registro
      end
    else
      if @user&.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to dashboard_path # Redirigir al dashboard después de iniciar sesión
      else
        flash.now[:alert] = 'Credenciales inválidas'
        render :new
      end
    end
  end

  def dashboard
    @categories = Category.all
    @inventory_transactions = InventoryTransaction.all
    @products = Product.all
    @suppliers = Supplier.all
  end

  def destroy
    session[:user_id] = nil # Eliminar la sesión actual del usuario
    redirect_to login_path, notice: "Has cerrado sesión correctamente." # Redirigir a la página de login
  end

  private

  def set_user
    @user = User.find_by(username: params[:username]) # Cambiado de email a username
  end

  def user_params
    params.require(:user).permit(:username, :password) # Permite los parámetros necesarios
  end

  def require_login
    redirect_to login_path unless session[:user_id]
  end
end
