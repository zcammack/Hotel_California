class TenantsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @tenant = Tenant.new
    end

    def create
        @tenant = current_user.tenants.build(tenant_params)
        if @tenant.save
            redirect_to tenants_path
        else
            render :new
        end
    end
end
