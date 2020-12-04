class InforsController < ApplicationController
  def index
  	@productions = Production.limit(6).offset(params[:offset])
  	render json: {
  		pages: render_to_string(@productions)
  	}		
  end	
  def show
  	@production = Production.find_by id: params[:id]
  	render json: {
  		name: @production.name,
  		roms: @production.production_details.pluck(:rom),
  		rams: @production.production_details.pluck(:ram)
  	}
  end
end
