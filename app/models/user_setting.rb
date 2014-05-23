class UserSetting < ActiveRecord::Base

  self.table_name = 'user_accounts'
  belongs_to :user
  belongs_to :setting

  private

  def self.constructor(id)
    where('account_id = ? AND setting_id = ?', 9, id)
  end

  def self.administrator(id)
    where('account_id >= ? AND setting_id = ?', 3, id)
  end

  def self.editor(id)
    where('account_id >= ? AND setting_id = ?', 2, id)
  end

  def self.contributor(id)
    where('account_id >= ? AND setting_id = ?', 1, id)
  end

end
