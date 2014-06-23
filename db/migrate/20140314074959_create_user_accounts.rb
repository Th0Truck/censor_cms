class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.integer :user_id
      t.integer :account_id
      t.integer :setting_id
      t.string :password
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
