# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

CSV.foreach(Rails.root.join('sample_data/patients.csv'), headers: true) do |row|
  patient = Patient.create({
    first_name: row["first_name"], 
    last_name: row["last_name"],
    gender: row["gender"], 
  	age: row["age"],
  	email: row["email"],
  	phone: row["phone"]
 	}) 

  Account.create({
    patient_id: patient.id,
    balance: 0
  })
end

CSV.foreach(Rails.root.join('sample_data/transaction_codes.csv'), headers: true) do |row|
	TransactionCode.create({
    entry_type: row["entry_type"], 
    title: row["title"],
    cdt_code: row["cdt_code"], 
    description: row["description"]
  }) 
end

CSV.foreach(Rails.root.join('sample_data/transactions.csv'), headers: true) do |row|
  patient_id = row["patient_id"]
  account = Patient.find(patient_id).account
  cdt_code = row["cdt_code"].to_i
  transaction_code = TransactionCode.find_by(cdt_code: cdt_code) || TransactionCode.new

  # Storing the amount as a multiple of 100 helps us avoid floating point errors
  amount = row["amount"].to_f * 100

  # We indicate a payment from a patient with a negative amount
  if transaction_code.is_credit?
    amount = amount * -1.0
  end

  transaction_code_id = !!transaction_code ? transaction_code.id : 0

  ledger_entry = LedgerEntry.create!({
    account_id: account.id,
    transaction_code_id: transaction_code_id,
    amount: amount,
    date: row["date"],
    performed_by: row["performed_by"]
  }) 
end

Account.includes(:ledger_entries).find_each do |account|
  account.calculate_balance
end


