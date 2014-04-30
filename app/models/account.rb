class Account < ActiveRecord::Base

  has_many :user_accounts
  has_many :users, through: :user_accounts

  def self.constructor
    where('id >= ?', 9)
  end

  def self.administrator
    where('id >= ?', 3)
  end

  def self.editor
    where('id >= ?', 2)
  end

  def self.contributor
    where('id >= ?', 2)
  end

end