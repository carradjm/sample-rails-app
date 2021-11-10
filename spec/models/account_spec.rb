require 'rails_helper'

RSpec.describe Account, type: :model do
	fixtures :accounts

 	context 'methods' do
  		it 'calculates the correct balance for the account' do
  			account = Account.first
  			ledger_entries = account.ledger_entries
  			expected_sum = ledger_entries.map {|entry| entry.amount }
  										 .reduce(:+)

  			expect(account.calculate_balance).to eq expected_sum
  		end

  		it 'returns the latest transaction date' do
  			account = Account.first
  			ledger_entries = account.ledger_entries
  			expected_transaction_date = ledger_entries.last.date

  			expect(account.latest_transaction_date).to eq expected_transaction_date
  		end
  	end
end
