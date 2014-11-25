class Ramble < ActiveRecord::Base

	belongs_to :user
	has_many :notes, dependent: :destroy

	# validates :name, presence: true
	validates :destination, presence: true

	def save_data_from_api
    	reddit = HTTParty.get("http://www.reddit.com/r/subreddit/search.json?q=newyorkcity&limit=5&sort=top")
    	reddit_data = JSON.parse(reddit.body)
      	self.reddit_thread = reddit_data['data']['children'][0]['data']['url']
      	[] << self.reddit_thread
      	save!
  	end

end

