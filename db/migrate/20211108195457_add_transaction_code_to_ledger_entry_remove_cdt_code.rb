class AddTransactionCodeToLedgerEntryRemoveCdtCode < ActiveRecord::Migration[6.1]
  def change
  	add_column :ledger_entries, :transaction_code_id, :integer
  	remove_column :ledger_entries, :cdt_code
  end
end
