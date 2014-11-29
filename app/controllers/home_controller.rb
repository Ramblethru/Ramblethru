class HomeController < ApplicationController
	# def search
	# 	parameters = { term: params[:term], limit: 16 }
	# 	render json: Yelp.client.search(‘Place Searched’, parameters)
	# end
  def logspin1
    @home_banner = true
  end
end
