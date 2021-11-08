json.extract! account, :id, :patient_id, :balance, :created_at, :updated_at
json.url account_url(account, format: :json)
