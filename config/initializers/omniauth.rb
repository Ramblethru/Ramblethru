Rails.application.config.middleware.use OmniAuth::Builder do
  provider :foursquare, "consumer_key", "consumer_secret" 
end