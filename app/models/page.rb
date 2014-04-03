class Page < ActiveRecord::Base

  has_many :users, through: :user_pages
  belongs_to :page
  has_many :pages
  has_many :sections
  belongs_to :setting
  attr_accessible :name, :order, :page_id

  def self.first_level
    where(page_id: nil)
  end

  def self.second_level(id)
    where(page_id: id)
  end
end
