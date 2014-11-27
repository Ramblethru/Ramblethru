class RamblesController < ApplicationController
    include HTTParty

    before_action :authenticate
    # before_save { |ramble| ramble.destination.downcase! }
 def show
        yelp             
        instagram
        reddit
        foursquare
        @ramble = Ramble.find(params[:id])
  end

  def yelp
        @ramble = Ramble.find(params[:id])
        params = { term: 'food',
           limit: 5,
       }
       @yelp = Yelp.client.search('New York', params)
  end

  def instagram
    instagram = HTTParty.get('https://api.instagram.com/v1/media/search?lat=40.7&lng=74.0&count=8&client_id=ea93d7b97c444c9bbfcf23cbbcb63ee4')
    instagram_data = JSON.parse(instagram.body)
    @instagram_images = instagram_data["data"]
  end

  def reddit
    reddit = HTTParty.get("http://www.reddit.com/r/subreddit/search.json?q=newyorkcity&limit=5&sort=top")   
    reddit_data = JSON.parse(reddit.body)
    @reddit_thread = reddit_data["data"]["children"]
  end

  def foursquare
    foursquare = HTTParty.get("http://api.foursquare.com/v2/venues/explore?near=NYC&limit=5&oauth_token=3SFP4NBFWJ2LIECDWGR5EU4FA5QXMP21LK2DNWT2GEUWCEIN&v=20141123")
    foursquare_data = JSON.parse(foursquare.body)
    @foursquare_venue = foursquare_data["response"]["groups"][0]["items"]
    @foursquare_tip = foursquare_data["response"]["groups"][0]["items"]
    @foursquare_venue_url = foursquare_data["response"]["groups"][0]["items"][0]["venue"]["name"]
  end

  def index
    respond_to do |format|
    format.html do
      if params[:search]
      @ramble = Ramble.search(params[:search]).order("created_at DESC")
      else
        redirect_to root_path, alert: "Sorry, you must enter something. Anything at all."
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

  def new
    @ramble = Ramble.new
    render 'rambles/create'
  end

  def create
    if current_user
        @ramble = current_user.rambles.build(ramble_params)
        @ramble.save!
        redirect_to ramble_path(@ramble)
    else
        render 'logins/login_form'
        flash.now[:notice] = "You must be logged in to create a ramble."
    end
  end

  def add_api
    @ramble = Ramble.find(params[:id])
    @ramble.save_reddit_thread
    redirect_to @ramble
  end

  def add_instagram
    @ramble = Ramble.find(params[:id])
    @ramble.save_instagram_url
    redirect_to @ramble
  end

  def update
   @ramble = Ramble.find(params[:id])
   if @ramble.update(ramble_params)
    flash[:notice] = 'Ramble was successfully updated.' 
    redirect_to @ramble

  else
    render :edit 
  end
  end

  def edit
  end

  def destroy
    @ramble.destroy
    redirect_to rambles_url
  end

  def find_ramble
  Ramble.find(:all, :conditions => conditions)
  end

private

  def ramble_params
  params.require(:ramble).permit(:start_date, :end_date, :name, :destination, :user_id, :reddit_thread)
  end
  
end
