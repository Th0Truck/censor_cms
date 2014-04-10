class Setting < ActiveRecord::Base

  has_many :pages
  has_many :sidebars

  attr_accessible :domain, :name, :login, :footer, :info, :analytics_api, :facebook, :facebook_secret, :googleplus, :googleplus_secret, :linkedin, :linkedin_secret, :homepage

  def self.for_host(host)
    subdomain = host.split('.').first
    where('domain like ?', host.split('.')[-2] + '%').first

  end

end
