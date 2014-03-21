class Section < ActiveRecord::Base

  has_many :users, through: :user_sections
  has_many :uploads, through: :upload_sections
  belongs_to :page

end
