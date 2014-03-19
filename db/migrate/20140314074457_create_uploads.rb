class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :name
      t.string :title
      t.integer :size
      t.string :type

      t.timestamps
    end
  end
end
