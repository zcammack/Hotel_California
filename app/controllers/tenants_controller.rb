class TenantsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @tenant = Tenant.new
    end

    def create
        @tenant = current_user.tenants.build(tenant_params)
        if @tenant.save

        else
            render :new
        end
    end

    private

    def tenant_params
        params.require(:tenant).permit(:first_name, :last_name, :age)
    end
end
