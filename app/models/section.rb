class Section < ActiveRecord::Base

  has_many :users, through: :user_sections

end
