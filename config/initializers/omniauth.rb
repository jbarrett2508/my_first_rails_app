OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['AUTH_FB_KEY'], ENV['AUTH_FB_SECRET']
end


