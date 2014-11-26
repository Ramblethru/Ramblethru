require "instagram"


class DiscoversController < ApplicationController

  # before_action :set_location, only: [:show, :edit, :update, :destroy]
  #
  # # GET /locations
  # # GET /locations.json
  # def index
  #   if params[:search].present?
  #     @locations = Location.near(params[:search], 50, :order => :distance)
  #   else
  #     @locations = Location.all
  #   end
  # end
  #
  # # GET /locations/1
  # # GET /locations/1.json
  # def show
  # end
  #
  # # GET /locations/new
  # def new
  #   @location = Location.new
  # end
  #
  # # GET /locations/1/edit
  # def edit
  # end
  #
  # # POST /locations
  # # POST /locations.json
  # def create
  #   @location = Location.new(location_params)
  #   if @location.save
  #     redirect_to @location
  #     flash[:notice] = 'Location was successfully created.'
  #   else
  #     render :new
  #   end
  # end
  #
  # # PATCH/PUT /locations/1
  # # PATCH/PUT /locations/1.json
  # def update
  #   respond_to do |format|
  #     if @location.update(location_params)
  #       format.html { redirect_to @location, notice: 'Location was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @location }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @location.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /locations/1
  # # DELETE /locations/1.json
  # def destroy
  #   @location.destroy
  #   respond_to do |format|
  #     format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  #
  # private
  # # Use callbacks to share common setup or constraints between actions.
  # def set_location
  #   @location = Location.find(params[:id])
  # end
  #
  # # Never trust parameters from the scary internet, only allow the white list through.
  # def location_params
  #   params.require(:location).permit(:address, :latitude, :longitude)
  # end

	def show
    #Yelp
		params = { term: 'food',
               limit: 5,
         }
    @yelp = Yelp.client.search('New York', params)

    #Instagram
   	instagram = HTTParty.get('https://api.instagram.com/v1/media/search?lat=40.7&lng=74.0&count=8&client_id=ea93d7b97c444c9bbfcf23cbbcb63ee4')
    instagram_data = JSON.parse(instagram.body)
   	@instagram_images = instagram_data["data"]
    # [0]["images"]["thumbnail"]["url"]

    #Reddit
    reddit = HTTParty.get("http://www.reddit.com/r/subreddit/search.json?q=newyorkcity&limit=5&sort=top")
    reddit_data = JSON.parse(reddit.body)
    @reddit_thread = reddit_data["data"]["children"]

    #Foursquare
    foursquare = HTTParty.get("http://api.foursquare.com/v2/venues/explore?near=NYC&limit=5&oauth_token=3SFP4NBFWJ2LIECDWGR5EU4FA5QXMP21LK2DNWT2GEUWCEIN&v=20141123")
    foursquare_data = JSON.parse(foursquare.body)
    @foursquare_venue = foursquare_data["response"]["groups"][0]["items"]
    @foursquare_tip = foursquare_data["response"]["groups"][0]["items"]
    @foursquare_venue_url = foursquare_data["response"]["groups"][0]["items"][0]["venue"]["name"]

  end

  def create_ramble
    @ramble = Ramble.new(ramble_params)
	end
end
