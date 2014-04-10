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

  def constructor?
    present? && account_id == 9
  end

  def admin?
    present? && account_id >= 3
  end

  def editor?
    present? && account_id >= 2
  end

  def contributor?
    present? && account_id >= 1
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      if auth.provider == 'facebook'
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      elsif auth.provider == 'linkedin'
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        #user.oauth_verifier = auth.credentials.oauth_verifier
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      elsif auth.provider == 'google_oauth2'
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.extra.raw_info.email
        user.avatar = auth.extra.raw_info.picture
        user.link = auth.extra.raw_info.link
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end

    end
  end
end
