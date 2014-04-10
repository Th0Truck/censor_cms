class CreateSectionsSidebars < ActiveRecord::Migration
  def change
    create_table :sections_sidebars do |t|
      t.string :section_id
      t.string :sidebar_id

      t.timestamps
    end
  end
end
