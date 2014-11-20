class RamblesController < ApplicationController

    def show
    end

    def create
    end

    def update
    end

    def edit
    end

    def destroy
    end

    private

    def ramble_params
      params.require(:ramble).permit(:start_date, :end_date, :name, :destination)
    end
end
