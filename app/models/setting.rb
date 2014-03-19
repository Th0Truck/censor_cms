class Setting < ActiveRecord::Base
  attr_accessible :domain, :name, :login, :footer, :info, :analytics_api, :facebook, :googleplus, :linkedin
end
