class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :gender
      t.integer :age
      t.string  :email
      t.string  :phone

      t.timestamps
    end

    add_index :patients, [:last_name, :first_name]
  end
end
