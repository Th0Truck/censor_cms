class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :file
      t.string :title
      t.integer :size
      t.string :filetype

      t.timestamps
    end
  end
end
