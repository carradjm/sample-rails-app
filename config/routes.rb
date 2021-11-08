Rails.application.routes.draw do
  resources :ledger_entries
  resources :transaction_codes
  resources :patients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
