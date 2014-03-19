class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :domain
      t.string :name
      t.integer :login
      t.integer :footer
      t.text :info
      t.string :analytics_api
      t.string :facebook
      t.string :googleplus
      t.string :linkedin
      t.integer :homepage

      t.timestamps
    end
  end
end
