class Setting < ActiveRecord::Base
  has_many :pages
  attr_accessible :domain, :name, :login, :footer, :info, :analytics_api, :facebook, :googleplus, :linkedin, :homepage

  def self.for_host(host)
    subdomain = host.split('.').first
    where('domain like ?', host.split('.')[-2] + '%').first

  end
end
