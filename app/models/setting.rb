class Setting < ActiveRecord::Base

  has_many :user_settings
  has_many :pages
  has_many :sidebars
  has_many :users, :through => :user_settings

  attr_accessible :domain, :name, :login, :footer, :info, :analytics_api, :facebook, :facebook_secret, :googleplus, :googleplus_secret, :linkedin, :linkedin_secret, :homepage

  def self.for_host(host)
    subdomain = host.split('.').first
    where('domain like ?', host.split('.')[-2] + '%').first

  end

  def self.constructor
    where('account_id = ?', 9)
  end

  def self.administrator
    where('account_id >= ?', 3)
  end

  def self.editor
    where('account_id >= ?', 2)
  end

  def self.contributor
    where('account_id >= ?', 1)
  end

end
