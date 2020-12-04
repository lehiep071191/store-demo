class ProductionsController < ApplicationController
  def index
    @productions = Production.all.pagination(page: params[:page], per_page: 12)
  

  end

  def show
  	@production = Production.find_by id: params[:id]

  	 rom = params[:rom]

      if rom.present?
        rams = @production.production_details.where('rom=?', params[:rom])
        render json:{
            data_ram:  rams.pluck(:ram).uniq,
            data_ram_all: @production.production_details.pluck(:ram).uniq
        },status: :ok
      else 
      @production_details = @production.production_details
    end
  end
end
