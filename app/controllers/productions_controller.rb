class ProductionsController < ApplicationController
  def index

  end

  def show
  	@production = Production.find_by id: params[:id]
  end
end
