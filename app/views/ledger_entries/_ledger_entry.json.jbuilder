json.extract! ledger_entry, :id, :cdt_code, :amount, :patient_id, :date, :performed_by, :created_at, :updated_at
json.url ledger_entry_url(ledger_entry, format: :json)
