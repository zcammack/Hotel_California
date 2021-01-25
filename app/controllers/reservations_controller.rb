class ReservationsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:tenant_id] && @tenant = Tenant.find_by_id(params[:tenant_id])
            @reservations = @tenant.reservations
        else
            @reservations = Reservation.all
        end
    end

    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = tenant.reservations.build(reservation_params)
        if @reservation.save
            redirect_to reservations_path
        else
            render :new
        end
    end

    def show
        @reservation = Reservation.find_by(id: params)
    end

    def edit
        @reservation = Reservation.find_by(id: params)
    end

    def update
        @reservation = Reservation.find_by(id: params)

    end

    def destroy

    end


    private

    def reservation_params
        params.require(:reservation).permit(:party_size, :start_date, :end_date)
    end
end
