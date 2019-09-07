class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.integer :upload_id
      t.string :input
      t.string :account_string
      t.string :status
      t.integer :d9
      t.integer :d8
      t.integer :d7
      t.integer :d6
      t.integer :d5
      t.integer :d4
      t.integer :d3
      t.integer :d2
      t.integer :d1

      t.timestamps
    end
  end
end
