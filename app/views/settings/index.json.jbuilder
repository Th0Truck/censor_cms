json.array!(@settings) do |setting|
  json.extract! setting, :id, :domain, :name, :login, :footer, :info, :analytics_api, :facebook, :googleplus, :linkedin
  json.url setting_url(setting, format: :json)
end
