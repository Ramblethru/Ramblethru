class RamblesController < ApplicationController
    include HTTParty

    def show
        @ramble = Ramble.find(params[:id])
    end

    # def search
    #     if ramble_params[:destination]
    #         location = Geocoder.coordinates(remote_ip)
    #         latitude = location[0]
    #         longitude = location[1]
    #         api_response(latitude, longitude)
    #     elsif location_params[:destination].empty?
    #         @error = "Please enter a valid address."
    #         render 'new'
    #     else
    #         location = Geocoder.search(location_params[:destination]).first
    #         api_response(location.latitude, location.longitude)
    #     end
    # end

    def new
        @ramble = Ramble.new
    end

    def create
        @ramble = current_user.rambles.create(ramble_params)
        redirect_to @ramble
    end

    def update
        @ramble.update(ramble_params)
        redirect_to @ramble
    end

    def edit
    end

    def destroy
        @ramble.destroy
        redirect_to rambles_url
    end

    private

    def ramble_params
      params.require(:ramble).permit(:start_date, :end_date, :name, :destination, :user_id)
    end
end
