Rails.application.config.middleware.use OmniAuth::Builder do
  provider :foursquare, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end
