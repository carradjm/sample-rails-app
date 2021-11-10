class Patient < ApplicationRecord
	has_one :account
	has_many :ledger_entries

	def full_name
		"#{first_name} #{last_name}"
	end
end
