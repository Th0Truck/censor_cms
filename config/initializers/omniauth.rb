OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, :setup => true
  provider :linkedin, :setup => true
  provider :google_oauth2, :setup => true
end