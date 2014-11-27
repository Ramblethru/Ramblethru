class Ramble < ActiveRecord::Base

	belongs_to :user
	has_many :notes, dependent: :destroy

	# validates :name, presence: true
	validates :destination, presence: true

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("destination like ?", "%#{query}%") 
  end

	def save_reddit_thread
   reddit = HTTParty.get("http://www.reddit.com/r/subreddit/search.json?q=newyorkcity&limit=5&sort=top")
   reddit_data = JSON.parse(reddit.body)
   self.reddit_thread = reddit_data['data']['children'][0]['data']['url']
   self.reddit_thread
   [] << self.reddit_thread
   save!
 end

 def save_instagram_url
  instagram = HTTParty.get('https://api.instagram.com/v1/media/search?lat=40.7&lng=74.0&count=8&client_id=ea93d7b97c444c9bbfcf23cbbcb63ee4')
  instagram_data = JSON.parse(instagram.body)
  self.instagram_url = instagram_data["data"][0]["images"]["thumbnail"]["url"]
  [] << self.instagram_url
  save!
end

end

