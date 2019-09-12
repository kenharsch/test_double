class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.integer :upload_id
      t.string :input
      t.string :account_string
      t.string :status

      t.timestamps
    end
  end
end
