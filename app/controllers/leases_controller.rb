class LeasesController < ApplicationController
    def index
        leases = Lease.all
        render json: leases, include: [:landlord, :tenant, :property]
    end 

    def create
        @new = Lease.create(lease_params)
        puts @new
    end 

    private

    def lease_params
        params.require(:lease).permit(:landlord_id, :tenant_id, :match_id, :lease_start_date, :lease_end_date, :active)
    end 
end
