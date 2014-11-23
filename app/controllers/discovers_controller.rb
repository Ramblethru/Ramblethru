require "instagram"


class DiscoversController < ApplicationController
	def show
		params = { term: 'food',
           limit: 3,
         }
    	@yelp = Yelp.client.search('San Francisco', params)

   		response = HTTParty.get('https://api.instagram.com/v1/media/search?lat=48.858844&lng=2.294351&client_id=ea93d7b97c444c9bbfcf23cbbcb63ee4')
   		 @data = JSON.parse(response.body)
   		 # render :json => @data
   		@results = @data["data"][0]["images"]["thumbnail"]["url"]

    # tiles = {:count => 50}
    # natural = 'vscocam'
    # client= Instagram.client(:client_id => 'ea93d7b97c444c9bbfcf23cbbcb63ee4')
    # @searched = Instagram.client.user_media_feed(777)
							
      @reddit = HTTParty.get("http://www.reddit.com/api/subreddits_by_topic.json?query=durham")	
      @reddit_data = JSON.parse(@reddit.body)


  end
	
end
