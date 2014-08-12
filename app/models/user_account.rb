class UserAccount < ActiveRecord::Base

  belongs_to :user
  belongs_to :account

  attr_accessible :password_hash, :password_salt, :password
end
