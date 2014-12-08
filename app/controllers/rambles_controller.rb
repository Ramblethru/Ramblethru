require "addressable/uri"
class RamblesController < ApplicationController
  include HTTParty

  before_action :authenticate, only: [:new, :create]

  def show
    @ramble = Ramble.find(params[:id])
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
    params = { sort: 2 }
    @yelp = Yelp.client.search("#{@ramble.destination}", params)
  end

  def instagram
    instagram = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{@ramble.latitude}&lng=#{@ramble.longitude}&distance=5000&count=20&client_id=#{ENV["INSTAGRAM_KEY"]}")
    instagram_data = JSON.parse(instagram.body)
    @instagram_images = instagram_data["data"]
  end

  def reddit
    uri = Addressable::URI.parse("http://www.reddit.com/api/subreddits_by_topic.json?query=#{@ramble.destination}")
    reddit = HTTParty.get(uri.normalize)
    reddit_data = JSON.parse(reddit.body)
    @reddit_thread = reddit_data
  end

  def foursquare
    foursquare = HTTParty.get("http://api.foursquare.com/v2/venues/explore?ll=#{@ramble.latitude},#{@ramble.longitude}&limit=20&oauth_token=#{ENV["FOURSQUARE_OAUTH"]}&v=20141123")
    foursquare_data = JSON.parse(foursquare.body)
    @foursquare_venue = foursquare_data["response"]["groups"][0]["items"]
    @foursquare_tip = foursquare_data["response"]["groups"][0]["items"]
    @foursquare_venue_url = foursquare_data["response"]["groups"][0]["items"][0]["venue"]["name"]
    #@foursquare_venue = @foursquare_venue.paginate(:page => 1, :per_page => 5)
  end

  def new
    # @discover = Discover.last
    @ramble = Ramble.new
  end

  def create
    respond_to do |format|
      format.html do
        if current_user
          @user = current_user
          @ramble = current_user.rambles.build(ramble_params)
          @ramble.save!
          redirect_to ramble_path(@ramble)
        else
          render 'logins/new'
          flash.now[:notice] = "You must be logged in to create a ramble."
        end
      end
      format.json do
        if current_user
          @user = current_user
          @ramble = current_user.rambles.build(ramble_params)
          @ramble.save!
          RambleMailer.ramble_created(@ramble.user, @ramble).deliver
          redirect_to ramble_path(@ramble)
        end
      end
    end
  end

  def index
    respond_to do |format|
      format.html do
        if params[:search]
          @ramble = Ramble.search(params[:search]).order("created_at DESC")
        end
      end
      format.js do
        if params[:search]
          @ramble = Ramble.search(params[:search]).order("created_at DESC")
          render :search, status: :created
        else
          render :create, status: :not_found
        end
      end
    end
  end

  def update
    @ramble = Ramble.find(params[:id])
    if @ramble.update(ramble_params)
      respond_to do |format|
        format.html { redirect_to @ramble}
        format.json { render json: @ramble }
      end
    else
      render :edit
    end
  end

  def edit
    @ramble = Ramble.find(params[:id])
  end

  def destroy
    @ramble = Ramble.find(params[:id])
    respond_to do |format|
      format.html do
        @ramble.destroy
        redirect_to root_path 
        flash[:notice] = "you deleted your ramble"
      end
      format.js do
        @ramble.destroy
        render 'rambles/remove', status: :success
      end
    end
  end

  private

  def ramble_params
    params.require(:ramble).permit(:start_date, :end_date, :name, :destination, :user_id, :reddit_thread, :instagram_url, :latitude, :longitude)
  end
end
