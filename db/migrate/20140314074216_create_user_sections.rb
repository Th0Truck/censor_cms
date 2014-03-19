class CreateUserSections < ActiveRecord::Migration
  def change
    create_table :user_sections do |t|
      t.integer :section_id
      t.integer :user_id

      t.timestamps
    end
  end
end
