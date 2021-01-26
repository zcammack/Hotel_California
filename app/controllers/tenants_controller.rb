class TenantsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tenant, only: [:show, :edit, :update, :destroy]

    def index
        @tenants = current_user.tenants
    end

    def show

    end

    def new
        @tenant = current_user.tenants.build
    end

    def edit

    end

    def create
        @tenant = current_user.tenants.build(tenant_params)
        if @tenant.save
            redirect_to tenant_path(@tenant), notice: 'Tenant was successfully created.'
        else
            render :new
        end
    end

    def update
        if @tenant.update(tenant_params)
            redirect_to tenant_path(@tenant), notice: 'Tenant was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @tenant.destroy
        redirect_to tenants_url, notice: 'Tenant was successfully deleted.'
    end


    private

    def set_tenant
        @tenant = current_user.tenants.find(params[:id])
    end

    def tenant_params
        params.require(:tenant).permit(:first_name, :last_name, :age)
    end
end
