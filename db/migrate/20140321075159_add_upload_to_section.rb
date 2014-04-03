class AddUploadToSection < ActiveRecord::Migration
  def change
    add_column :sections, :upload, :string
  end
end
