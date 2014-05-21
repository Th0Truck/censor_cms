class UserSetting < ActiveRecord::Base

  self.table_name = 'user_accounts'
  belongs_to :user
  belongs_to :setting

  private

  def self.constructor
    where('account_id = ?', 9)
  end

  def self.administrator
    where('account_id >= ? AND setting_id = ?', 3, current_domain.id)
  end

  def self.administratorer
    where('account_id >= ?', 3).joins(:users)
  end

  def self.editor
    where('account_id >= ?', 2)
  end

  def self.contributor
    where('account_id >= ?', 1)
  end

end
