class CreateSidebars < ActiveRecord::Migration
  def change
    create_table :sidebars do |t|
      t.string :setting_id
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
