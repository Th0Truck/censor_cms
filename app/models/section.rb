class Section < ActiveRecord::Base

  has_many :upload_sections
  has_many :users, through: :user_sections
  has_many :uploads, through: :upload_sections
  has_many :images, through: :upload_sections
  has_many :sidebars, through: :sections_sidebars
  belongs_to :page

  attr_accessible :header, :article, :user_id, :page_id, :files, :order, :bgcolor, :fontcolor

end
