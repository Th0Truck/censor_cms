# encoding: utf-8
class Setting < ActiveRecord::Base

  has_many :user_settings
  has_many :pages
  has_many :sidebars
  has_many :users, :through => :user_settings

  attr_accessible :domain, :name, :login, :footer, :info, :analytics_api, :facebook, :facebook_secret, :googleplus, :googleplus_secret, :linkedin, :linkedin_secret, :homepage, :css, :css_instance, :js, :js_instance

  def self.for_host(host)
    subdomain = host.split('.').first
    where('domain like ?', host.split('.')[-2] + '%').first

  end

end
