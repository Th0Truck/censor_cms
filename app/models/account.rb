class Account < ActiveRecord::Base

  has_many :user_accounts
  has_many :users, through: :user_accounts

  def self.constructor
    where('account_id >= ?', 9)
  end

  def self.administrator
    where('account_id >= ?', 3)
  end

  def self.editor
    where('account_id >= ?', 1)
  end

  def self.contributor
    where('account_id >= ?', 1)
  end

end