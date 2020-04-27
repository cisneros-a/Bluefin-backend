class LeasesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :landlord_lease, :tenant_lease]

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
        lease = Lease.all.find{|lease| lease.property_id == num}
        property = Property.find(params[:id])
        if lease 
        fixes = Fix.all.select{|fix| fix.property_id == num} 
        fixes_with_uploads = fixes.map{ |fix| { fix: fix, uploads: rails_blob_path(fix.uploads)}} 
        tenant = User.all.find{|user| user.id == lease.tenant_id}
        render json: {lease: lease, property: property, tenant: tenant, fixes: fixes_with_uploads }
        else 
            render json: {lease: "none", fixes: [], property: property, tenant: nil }
        end 
      end 

      def tenant_lease

        lease = Lease.all.find{|lease| lease.tenant_id == Integer(params[:id])}
        if lease
        num = Integer(lease.property_id)
        property = Property.find(num)
        fixes = Fix.all.select{|fix| fix.property_id == num} 
        fixes_with_uploads = fixes.map{ |fix| { fix: fix, uploads_url: rails_blob_path(fix.uploads)}} 
        landlord = User.all.find{|user| user.id == lease.landlord_id}
        
        render json: {lease: lease, property: property, landlord: landlord, fixes: fixes_with_uploads }

        else 
            render json: {lease: "none", fixes: []}
        end
      end

    private

    def lease_params
        params.require(:lease).permit(:landlord_id, :tenant_id, :property_id, :lease_start_date, :lease_end_date, :active)
    end 
end
