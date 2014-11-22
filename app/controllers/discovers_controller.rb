class DiscoversController < ApplicationController
	def show
		params = { term: 'food',
           limit: 3,
         }
    	@yelp = Yelp.client.search('San Francisco', params)
							
	end
	
end
