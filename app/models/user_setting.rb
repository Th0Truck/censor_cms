class UserSetting < ActiveRecord::Base

  self.table_name = 'user_accounts'
  belongs_to :user
  belongs_to :setting

end
