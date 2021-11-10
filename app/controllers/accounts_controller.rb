class AccountsController < ApplicationController
  # GET /accounts or /accounts.json
  def index
    if params[:sort] == "balance" || params[:sort].nil?
      @accounts = Account.all.order("balance DESC")
    elsif params[:sort] == "latest_transaction_date"
      @accounts = Account.all.sort { |a, b| a.latest_transaction_date <=> b.latest_transaction_date }
                             .partition { |account| account.balance >= 0 }
                             .flatten
    end
  end
end
