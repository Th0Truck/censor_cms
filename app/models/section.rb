class Section < ActiveRecord::Base

  has_many :upload_sections
  has_many :users, through: :user_sections
  has_many :uploads, through: :upload_sections
  belongs_to :page

  attr_accessible :header, :article, :user_id, :page_id, :files
end
