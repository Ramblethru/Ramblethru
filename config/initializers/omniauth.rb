Rails.application.config.middleware.use OmniAuth::Builder do
  provider :foursquare, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
end
