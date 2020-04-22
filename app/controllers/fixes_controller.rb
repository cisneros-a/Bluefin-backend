class FixesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :update, :update_resolved]

    def index
        fixes = Fix.all
        render json: fixes, include: [:landlord, :tenant, :property]
    end 

    def create
        fix = Fix.create(fix_params)
        render json: fix.id
    end 

    def show
        fix = Fix.find(params[:id])
        uploads = rails_blob_path(fix.uploads, disposition: "attachment", only_path: true)
       if fix
          render json: { fix: fix, uploads: uploads }
        else
          render json: {
            status: 500,
            errors: ['user not found']
          }
        end
    end

    def update
        fix = Fix.find(params[:id])
      fix.update(uploads: params[:uploads])
      uploads_url = rails_blob_path(fix.uploads)
      render json: { fix: fix, uploads_url: uploads_url }
      end

      def update_resolved
        fix = Fix.find(params[:id])
        fix.update(fix_params)
      end

      def property_fixes
        property = Property.find(params[:id])
        fixes = Fix.all.select{|fix| fix.property_id == property.id} 
        render json: fixes, include: [:landlord, :tenant, :property]
      end 

    private

    def fix_params
        params.require(:fix).permit(:landlord_id, :tenant_id, :property_id, :description, :status)
    end 
end