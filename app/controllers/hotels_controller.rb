class HotelsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_hotel, only: [:show, :edit, :update, :destroy]

    def index
        @hotels = current_user.hotels
    end

    def show

    end

    def new
        @hotel = current_user.hotels.build
    end

    def edit

    end

    def create
        @hotel = current_user.hotels.build(hotel_params)
        if @hotel.save
            redirect_to hotel_path(@hotel), notice: 'Hotel was successfully created.'
        else
            render :new
        end
    end

    def update
        if @hotel.update(hotel_params)
            redirect_to hotel_path(@hotel), notice: 'Hotel was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @hotel.destroy
        redirect_to hotels_url, notice: 'Hotel was successfully deleted.'
    end


    private

    def set_hotel
        @hotel = current_user.hotels.find(params[:id])
    end

    def hotel_params
        params.require(:hotel).permit(:name, :size, :wifi, :breakfast, :accessibility)
    end
end
