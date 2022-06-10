class TenantsController < ApplicationController

    def index 
        render json: Tenant.all
    end

    def create 
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def update 
        tenant = Tenant.find(params[:id])
        tenant.update(tenant_params)
        render json: tenant, status: :ok
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def destroy 
        tenant = Tenant.find(params[:id])
        tenant.destroy
        head :no_content
    end

    private 

    def tenant_params 
        params.permit(:name, :age)
    end

end
