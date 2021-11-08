class TransactionCode < ApplicationRecord
	def is_charge?
		entry_type == "Procedure"
	end

	def is_credit?
		entry_type == "Payment"
	end
end
