class HotelsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @hotels = Hotel.all
    end

    def show
       @hotel = Hotel.find_by_id(params[:id])
    end
end
