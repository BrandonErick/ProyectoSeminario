class InventoryTransactionsController < ApplicationController
  before_action :set_inventory_transaction, only: %i[show edit update destroy]

  # GET /inventory_transactions or /inventory_transactions.json
  def index
    @inventory_transactions = InventoryTransaction.includes(:product).all # Evita N+1 queries con includes

    respond_to do |format|
      format.html # index.html.erb
      format.json # index.json.jbuilder
      format.xlsx do
        response.headers['Content-Disposition'] = 'attachment; filename="transacciones_inventario.xlsx"'
        render xlsx: 'index', template: 'inventory_transactions/index' # Asegúrate de tener la plantilla correcta
      end
    end
  end

  # GET /inventory_transactions/1 or /inventory_transactions/1.json
  def show
  end

  # GET /inventory_transactions/new
  def new
    @inventory_transaction = InventoryTransaction.new
  end

  # GET /inventory_transactions/1/edit
  def edit
  end

  # POST /inventory_transactions or /inventory_transactions.json
  def create
    @inventory_transaction = InventoryTransaction.new(inventory_transaction_params)

    respond_to do |format|
      if @inventory_transaction.save
        format.html { redirect_to @inventory_transaction, notice: "La transacción fue creada exitosamente." }
        format.json { render :show, status: :created, location: @inventory_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_transactions/1 or /inventory_transactions/1.json
  def update
    respond_to do |format|
      if @inventory_transaction.update(inventory_transaction_params)
        format.html { redirect_to @inventory_transaction, notice: "La transacción fue actualizada exitosamente." }
        format.json { render :show, status: :ok, location: @inventory_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_transactions/1 or /inventory_transactions/1.json
  def destroy
    @inventory_transaction.destroy!
    
    respond_to do |format|
      format.html { redirect_to inventory_transactions_url, status: :see_other, notice: "La transacción fue eliminada exitosamente." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory_transaction
    @inventory_transaction = InventoryTransaction.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to inventory_transactions_url, alert: "Transacción no encontrada." }
      format.json { render json: { error: "Transacción no encontrada" }, status: :not_found }
    end
  end

  # Only allow a list of trusted parameters through.
  def inventory_transaction_params
    params.require(:inventory_transaction).permit(:product_id, :quantity, :transaction_type, :date, :description)
  end
end
