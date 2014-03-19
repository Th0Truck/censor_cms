class User < ActiveRecord::Base

  has_many :sections, through: :user_sections
  has_many :pages, through: :user_pages
  belongs_to :account
  attr_accessible :name, :email, :password, :password_confirmation, :account

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def admin?
    account_id == 1
  end

  def editor?
    account_id == 2
  end

  def contributor?
    account_id == 3
  end

end
