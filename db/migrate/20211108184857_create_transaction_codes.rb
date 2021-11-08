class CreateTransactionCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_codes do |t|
      t.string :entry_type
      t.string :title
      t.integer :cdt_code
      t.string :description

      t.timestamps
    end
  end
end
