class Account < ApplicationRecord
	belongs_to :patient
	has_many :ledger_entries, -> { order(created_at: :desc) }

  	delegate :full_name, to: :patient, prefix: true
  	delegate :phone, to: :patient, prefix: false

  	after_commit -> { broadcast_update_later_to("AccountsChannel") }

	def calculate_balance
		self.balance = ledger_entries.reduce(0) do |sum, entry|
			sum += entry.amount
		end

    	save!
    	return balance
	end

	def balance_in_dollars
		balance / 100.0
	end

	def latest_transaction_date
		ledger_entries.last.date
	end
end
