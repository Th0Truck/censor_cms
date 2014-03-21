class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :header
      t.text :article
      t.integer :user_id
      t.integer :order
      t.integer :page_id

      t.timestamps
    end
  end
end
