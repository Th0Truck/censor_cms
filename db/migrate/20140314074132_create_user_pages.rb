class CreateUserPages < ActiveRecord::Migration
  def change
    create_table :user_pages do |t|
      t.integer :page_id
      t.integer :user_id

      t.timestamps
    end
  end
end
