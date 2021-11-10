class LedgerEntriesController < ApplicationController
  before_action :set_ledger_entry, only: %i[ show edit update destroy ]

  # GET /ledger_entries or /ledger_entries.json
  def index
    @ledger_entries = LedgerEntry.all
  end

  # GET /ledger_entries/new
  def new
    @ledger_entry = LedgerEntry.new
  end

  # POST /ledger_entries or /ledger_entries.json
  def create
    account = Account.find_by(patient_id: ledger_entry_params[:patient_id])
    transaction_code = TransactionCode.find_by(cdt_code: ledger_entry_params[:cdt_code])

    @ledger_entry = LedgerEntry.new({
      amount: ledger_entry_params[:amount],
      account: account,
      date: ledger_entry_params[:date],
      performed_by: ledger_entry_params[:performed_by],
      transaction_code: transaction_code
    })

    respond_to do |format|
      if @ledger_entry.save
        format.html { redirect_to controller: :accounts, action: :index  }
        format.json { render :show, status: :created, location: @ledger_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ledger_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ledger_entry
      @ledger_entry = LedgerEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ledger_entry_params
      params.require(:ledger_entry).permit(:cdt_code, :amount, :patient_id, :date, :performed_by)
    end
end
