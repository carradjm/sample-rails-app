require 'rails_helper'

describe LedgerEntriesController do
	fixtures :accounts, :transaction_codes

	def new_ledger_entry
    	{ 	
    		amount: 10,
	     	patient_id: Patient.first.id,
	     	date: DateTime.now,
	      	performed_by: "Doctor",
	      	cdt_code: TransactionCode.first.cdt_code
	    }
  	end

	describe "POST create", type: :controller do
	    describe "with valid params" do
	      it "creates a new Ledger Entry" do
	        expect {
	          post :create, params: { ledger_entry: new_ledger_entry }
	        }.to change(LedgerEntry, :count).by(1)
	      end

	      it "redirects to the accounts index page" do
	        post :create, params: { ledger_entry: new_ledger_entry }
	        response.should redirect_to(accounts_path)
	      end
	    end
	end
end


