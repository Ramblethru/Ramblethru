require "addressable/uri"
class Ramble < ActiveRecord::Base
  geocoded_by :destination
  after_validation :geocode, :if => :destination_changed?

	belongs_to :user
	has_many :notes, dependent: :destroy

	validates :name, :destination, :latitude, :longitude, presence: true

  def save_reddit_thread
    uri = Addressable::URI.parse("http://www.reddit.com/r/subreddit/search.json?q=#{@ramble.destination}&limit=5&sort=top")
    reddit = HTTParty.get(uri.normalize)
    reddit_data = JSON.parse(reddit.body)
    self.reddit_thread = reddit_data['data']['children'][0]['data']['url']
    self.reddit_thread
    [] << self.reddit_thread
    save!
  end

  def save_instagram_url
    instagram = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{@ramble.latitude}&lng=#{@ramble.longitude}&count=8&client_id=ea93d7b97c444c9bbfcf23cbbcb63ee4")
    instagram_data = JSON.parse(instagram.body)
    self.instagram_url = instagram_data["data"][0]["images"]["thumbnail"]["url"]
    [] << self.instagram_url
    save!
  end

  def self.search(query)
    #where(:destination, query)
    where("destination like ?", "%#{query}%")
  end
end

