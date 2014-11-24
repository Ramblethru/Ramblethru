require "instagram"


class DiscoversController < ApplicationController
	def show
    #Yelp
		params = { term: 'food',
           limit: 3,
         }
    @yelp = Yelp.client.search('San Francisco', params)

    #Instagram
   	instagram = HTTParty.get('https://api.instagram.com/v1/media/search?lat=40.7&lng=74.0&count=8&client_id=ea93d7b97c444c9bbfcf23cbbcb63ee4')
    instagram_data = JSON.parse(instagram.body)
   	@instagram_images = instagram_data["data"]
    # [0]["images"]["thumbnail"]["url"]
				
    #Reddit    			
    reddit = HTTParty.get("http://www.reddit.com/api/subreddits_by_topic.json?query=newyorkcity")	
    @reddit_data = JSON.parse(reddit.body)

    #Foursquare
    foursquare = HTTParty.get("http://api.foursquare.com/v2/venues/explore?near=NYC&limit=5&oauth_token=3SFP4NBFWJ2LIECDWGR5EU4FA5QXMP21LK2DNWT2GEUWCEIN&v=20141123")
    foursquare_data = JSON.parse(foursquare.body)
    @foursquare_venue = foursquare_data["response"]["groups"][0]["items"]
    @foursquare_tip = foursquare_data["response"]["groups"][0]["items"]
    @foursquare_venue_url = foursquare_data["response"]["groups"][0]["items"][0]["venue"]["name"]

  end
	
end
