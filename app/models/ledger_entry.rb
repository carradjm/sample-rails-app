class LedgerEntry < ApplicationRecord
	belongs_to :account
	has_one :transaction_code
end
