class RoomsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_hotel, only: [:show, :edit, :update, :destroy]
    before_action :set_room, only: [:show, :edit, :update, :destroy]

    def show
        
    end

    def index
        @hotel = Hotel.find(params[:hotel_id])
    end

    def edit

    end

    def create
        @hotel = Hotel.find(params[:hotel_id])
        @room = @hotel.rooms.create(room_params)
        redirect_to hotel_path(@hotel)
    end

    def update
        if @room.update
            redirect_to @hotel, notice: 'Room has been successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @room.destroy
        redirect_to @hotel, notice: 'Room was successfully deleted.'
    end

    private

    def set_hotel
        @hotel = current_user.hotels.find(params[:hotel_id])
    end

    def set_room
        @room = @hotel.rooms.find(params[:id])
    end

    def room_params
        params.require(:room).permit(:room_number, :smoking)
    end
end
