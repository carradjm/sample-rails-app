class LedgerEntry < ApplicationRecord
	belongs_to :account
	belongs_to :transaction_code

	after_commit -> { calculate_account_balance }

	def calculate_account_balance
		account.calculate_balance
	end
end
