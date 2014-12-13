OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 'AUTH_FB_KEY', 'AUTH_FB_SECRET'
end


