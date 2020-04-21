class LeasesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :landlord_lease]

    def index
        leases = Lease.all
        render json: leases, include: [:landlord, :tenant, :property]
    end 

    def create
        @new = Lease.create(lease_params)
        puts @new
    end 

    def landlord_lease
        num = Integer(params[:id])
        property = Property.find(params[:id])
        fixes = Fix.all.select{|fix| fix.property_id == num} 
        fixes_with_uploads = fixes.map{ |fix| { fix: fix, uploads: rails_blob_path(fix.uploads)}} 
        lease = Lease.all.find{|lease| lease.property_id == num}
        tenant = User.all.find{|user| user.id == lease.tenant_id}
        

        render json: {lease: lease, property: property, tenant: tenant, fixes: fixes_with_uploads }
      end 

    private

    def lease_params
        params.require(:lease).permit(:landlord_id, :tenant_id, :property_id, :lease_start_date, :lease_end_date, :active)
    end 
end
