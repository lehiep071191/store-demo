class ProductionDetailsController < ApplicationController
	def index
		@production = Production.find_by id: params[:production_id]
		roms = @production.production_details.where("color=?", params[:color])
		render json:{
			data_rom: roms.pluck(:rom).uniq,
			data_rom_all: @production.production_details.pluck(:rom).uniq
		},status: :ok

		# rams = @production.production_details.where('rom=?', params[:rom])
		# render json: {
		# 	data_ram: rams = @roms.pluck(:ram).uniq,
		# 	data_ram_all: @production.production_details.pluck(:ram).uniq
		# },status: :ok
	end	
	def show
		@production = production.find_by id: params[:production_id]
		@production_detail = productionDetail.find_by id: params[:id]
	end	
end
