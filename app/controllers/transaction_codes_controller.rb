class TransactionCodesController < ApplicationController
  before_action :set_transaction_code, only: %i[ show edit update destroy ]

  # GET /transaction_codes or /transaction_codes.json
  def index
    @transaction_codes = TransactionCode.all
  end

  # GET /transaction_codes/1 or /transaction_codes/1.json
  def show
  end

  # GET /transaction_codes/new
  def new
    @transaction_code = TransactionCode.new
  end

  # GET /transaction_codes/1/edit
  def edit
  end

  # POST /transaction_codes or /transaction_codes.json
  def create
    @transaction_code = TransactionCode.new(transaction_code_params)

    respond_to do |format|
      if @transaction_code.save
        format.html { redirect_to @transaction_code, notice: "Transaction code was successfully created." }
        format.json { render :show, status: :created, location: @transaction_code }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaction_codes/1 or /transaction_codes/1.json
  def update
    respond_to do |format|
      if @transaction_code.update(transaction_code_params)
        format.html { redirect_to @transaction_code, notice: "Transaction code was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction_code }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_codes/1 or /transaction_codes/1.json
  def destroy
    @transaction_code.destroy
    respond_to do |format|
      format.html { redirect_to transaction_codes_url, notice: "Transaction code was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_code
      @transaction_code = TransactionCode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_code_params
      params.require(:transaction_code).permit(:entry_type, :title, :cdt_code, :description)
    end
end
