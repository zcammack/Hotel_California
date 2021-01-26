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
        @reservation.build_tenant
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
        @reservation = Reservation.find_by(id: params[:id])
    end

    def edit
        @reservation = Reservation.find_by(id: params[:id])
    end

    def update
        @reservation = Reservation.find_by(id: params[:id])

    end

    def destroy

    end


    private

    def reservation_params
        params.require(:reservation).permit(:party_size, :start_date, :end_date, tenant_attributes: [:first_name, :last_name, :age])
    end
end
