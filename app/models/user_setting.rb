class UserSetting < ActiveRecord::Base

  self.table_name = 'user_accounts'
  belongs_to :user
  belongs_to :setting

  before_save :encrypt_password
  private

  def constructor(id)
    where('account_id = ? AND setting_id = ?', 9, id)
  end

  def admin(id)
    where('account_id >= ? AND setting_id = ?', 3, id)
  end

  def editor(id)
    where('account_id >= ? AND setting_id = ?', 2, id)
  end

  def contributor(id)
    where('account_id >= ? AND setting_id = ?', 1, id)
  end

  def self.new_user(setting, password)
    create(account_id: 0,password: password,setting_id:setting)
    #account_id = 0
    #password = password
    #setting_id = setting
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      self.password = nil
    end
  end
end
