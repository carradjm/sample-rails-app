json.extract! transaction_code, :id, :entry_type, :title, :cdt_code, :description, :created_at, :updated_at
json.url transaction_code_url(transaction_code, format: :json)
