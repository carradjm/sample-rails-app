class CreateLedgerEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :ledger_entries do |t|
      t.integer :cdt_code
      t.integer :amount
      t.integer :patient_id
      t.datetime :date
      t.string :performed_by

      t.timestamps
    end
  end
end
