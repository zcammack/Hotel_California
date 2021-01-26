class ReservationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tenant, only: [:show, :edit, :update, :destroy]
    before_action :set_reservation, only: [:show, :edit, :update, :destroy]

    def show
        
    end

    def edit

    end

    def create
        @tenant = Tenant.find(params[:tenant_id])
        @reservation = @tenant.reservations.create(reservation_params)
        redirect_to tenant_path(@tenant)
    end

    def update
        if @reservation.update
            redirect_to tenant_path(@tenant), notice: 'Reservation has been successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @reservation.destroy
        redirect_to tenant_path(@tenant), notice: 'Reservation was successfully deleted.'
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
