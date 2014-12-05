require "instagram"
require "addressable/uri"

class DiscoversController < ApplicationController
  before_action :set_discover, only: [:show]

  def new
    @discover = Discover.new
  end

  def create
    @discover = Discover.new(discover_params)
    if @discover.save
      redirect_to @discover
    else
      render :new
    end
  end

  def show
    if yelp != nil
      yelp
    end
    if instagram != nil
      instagram
    end
    if reddit != nil
      reddit
    end
    if foursquare != nil
      foursquare
    end
  end

  def yelp
    #Yelp
    params = { limit: 5,
               sort: 2}
    @yelp = Yelp.client.search("#{@discover.destination}", params)
  end

  def instagram
    #Instagram
    instagram = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{@discover.latitude}&lng=#{@discover.longitude}&distance=5000&count=10&client_id=ea93d7b97c444c9bbfcf23cbbcb63ee4")
    instagram_data = JSON.parse(instagram.body)
    @instagram_images = instagram_data["data"]
    # [0]["images"]["thumbnail"]["url"]
  end

  def reddit
    #Reddit
    uri = Addressable::URI.parse("http://www.reddit.com/api/subreddits_by_topic.json?query=#{@discover.destination}")
    reddit = HTTParty.get(uri.normalize)
    reddit_data = JSON.parse(reddit.body)
    @reddit_thread = reddit_data
  end

  def foursquare
    #Foursquare
    foursquare = HTTParty.get("http://api.foursquare.com/v2/venues/explore?ll=#{@discover.latitude},#{@discover.longitude}&limit=5&sortByDistance=true&oauth_token=3SFP4NBFWJ2LIECDWGR5EU4FA5QXMP21LK2DNWT2GEUWCEIN&v=20141123")
    foursquare_data = JSON.parse(foursquare.body)
    @foursquare_venue = foursquare_data["response"]["groups"][0]["items"]
    @foursquare_tip = foursquare_data["response"]["groups"][0]["items"]
    @foursquare_venue_url = foursquare_data["response"]["groups"][0]["items"][0]["venue"]["name"]
  end

  def create_ramble
    @ramble = Ramble.new(ramble_params)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_discover
    @discover = Discover.friendly.find(params[:id])
  end

  def discover_params
    params.require(:discover).permit(:destination, :latitude, :longitude)
  end
end
