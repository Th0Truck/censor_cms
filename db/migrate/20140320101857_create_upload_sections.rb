class CreateUploadSections < ActiveRecord::Migration
  def change
    create_table :upload_sections do |t|
      t.integer :section_id
      t.integer :upload_id
      t.integer :image_id

      t.timestamps
    end
  end
end
