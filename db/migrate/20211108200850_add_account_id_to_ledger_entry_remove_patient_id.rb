class AddAccountIdToLedgerEntryRemovePatientId < ActiveRecord::Migration[6.1]
  def change
  	add_column :ledger_entries, :account_id, :integer
  	remove_column :ledger_entries, :patient_id
  end
end
