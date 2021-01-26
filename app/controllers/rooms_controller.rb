class RoomsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def show
        @room = Room.find_by(id: params[:id])
    end

    def index
        if params[:hotel_id] && @hotel = Hotel.find_by_id(params[:hotel_id])
            @rooms = @hotel.rooms
        else
            redirect_to hotels_path
        end
    end
end
