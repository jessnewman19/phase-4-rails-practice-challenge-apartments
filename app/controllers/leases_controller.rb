class LeasesController < ApplicationController

    def index 
        render json: Lease.all
    end

    def create 
        lease = Lease.create!(lease_params)
        if lease.valid? 
            render json: lease, status: :created
        else 
            render json: {errors: lease.errors.full_messages}, status: unprocessable_entity
        end
    end

    def destroy 
        lease = Lease.find(params[:id])
        if lease 
            lease.destroy
            render json: {message: 'Lease was deleted'}, status: :accepted
        else 
            render json: {message: 'Could Not Be Found'}, status: :unprocessable_entity
        end
    end

    private 

    def lease_params 
        params.permit(:rent, :apartment_id, :tenant_id)
    end

end
