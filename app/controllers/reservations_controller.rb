class ReservationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tenant, only: [:show, :edit, :update, :destroy]
    before_action :set_reservation, only: [:show, :edit, :update, :destroy]

    def show
        
    end

    def index
        @tenant = Tenant.find(params[:tenant_id])
    end

    def edit

    end

    def create
        @tenant = Tenant.find(params[:tenant_id])
        @room = Room.find(params[:reservation][:id])
        @reservation = @tenant.reservations.new(reservation_params)
        @reservation.room_id = @room.id
        if @reservation.save
            redirect_to tenant_reservation_path(@tenant, @reservation), notice: 'Reservation was successfully created!'
        else
            render :_errorform, notice: 'Reservation has not been saved.'
        end
    end

    def update
        if @reservation.update(reservation_params)
            redirect_to tenant_reservations_path(@tenant), notice: 'Reservation has been successfully updated.'
        else
            render :_errorform, notice: 'Reservation has not been saved.'
        end
    end

    def destroy
        if @reservation.destroy
            redirect_to tenant_reservations_path(@tenant), notice: 'Reservation was successfully deleted.'
        else
            redirect_to tenant_reservations_path(@tenant), notice: 'Reservation was not deleted.'
        end
    end

    private

    def set_tenant
        @tenant = current_user.tenants.find(params[:tenant_id])
    end

    def set_reservation
        @reservation = @tenant.reservations.find(params[:id])
    end

    def reservation_params
        params.require(:reservation).permit(:party_size, :start_date, :end_date)
    end
end
