class Account < ApplicationRecord
	belongs_to :patient
	has_many :ledger_entries, -> { order(created_at: :desc) }

	def calculate_balance
		ledger_entries.reduce(0) do |sum, entry|
			sum += entry.amount
		end
	end
end
