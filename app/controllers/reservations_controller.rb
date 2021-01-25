class ReservationsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @reservation = Reservation.new
    end

    def create
        binding.pry
    end
end
