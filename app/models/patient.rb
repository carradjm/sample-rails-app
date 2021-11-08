class Patient < ApplicationRecord
	has_one :account
	has_many :ledger_entries
end
