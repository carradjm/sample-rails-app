class TransactionCode < ApplicationRecord
	has_many :ledger_entries
	
	def is_charge?
		entry_type == "Procedure"
	end

	def is_credit?
		entry_type == "Payment"
	end
end
