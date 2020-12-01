class Admin::ProductionsController < ApplicationController
	before_action :set_production, only: [:show]

	def index

	end

	def new
		@production = Production.new
		@production_detail = @production.production_details.build
	end
	
	def create
		pr = produciton_params.merge(brand: params[:brand].to_i)
		@production = Production.new pr
		if @production.save!
			flash[:success] = "production create"
			redirect_to admin_productions_path
		end	
	end
	def show

	end	

	private
	def set_production
		@production = Production.find_by id: params[:id]
	end	
	def produciton_params
		params.require(:production).permit(:name, :brand, production_details_attributes: [:color, :rom,:ram, :product_id, :_destroy])
	end	
end	