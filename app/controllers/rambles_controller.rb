class RamblesController < ApplicationController

    def show
        @ramble = Ramble.find(params[:id])
    end

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
