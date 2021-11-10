class LedgerEntry < ApplicationRecord
	belongs_to :account
	belongs_to :transaction_code

	delegate :calculate_balance, to: :account

	after_commit -> { calculate_balance }
end
