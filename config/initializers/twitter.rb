require 'twitter'

client = Twitter::REST::Client.new do |config|
	config.consumer_key        = ENV['TWITTER_KEY']
	config.consumer_secret     = ENV['TWITTER_SECRET']
	config.access_token        = ENV['TWITTER_TOKEN']
	config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
end
