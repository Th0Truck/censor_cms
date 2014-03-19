class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_hash
      t.string :password_salt
      t.string :uid
      t.string :provider
      t.string :icon

      t.timestamps
    end
  end
end