class RoomsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_hotel, only: [:show, :edit, :update, :destroy]
    before_action :set_room, only: [:show, :edit, :update, :destroy]

    def new
        @hotel = Hotel.find(params[:hotel_id])
    end

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
        if @room.save
            redirect_to hotel_path(@hotel), notice: 'Room was successfully created.'
        else
            render :new, notice: 'Room has not been saved.'
        end
    end

    def update
        if @room.update(room_params)
            redirect_to hotel_rooms_path(@hotel), notice: 'Room has been successfully updated.'
        else
            render :_errorform, notice: 'Room has not been saved.'
        end
    end

    def destroy
        if @room.destroy
            redirect_to hotel_rooms_path(@hotel), notice: 'Room was successfully deleted.'
        else
            redirect_to hotel_rooms_path(@hotel), notice: 'Room was not deleted.'
        end
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
