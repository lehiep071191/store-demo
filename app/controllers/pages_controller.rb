class PagesController < ApplicationController
  def home
  	@productions = Production.all.paginate(:page => params[:page], :per_page => 12)

  end

  def help
  	# @productions = Production.all
  	@productions = Production.limit(6).offset(params[:page])
  end


  def contact
  	@productions = Production.all.paginate(page: params[:page], per_page: 6)
  	respond_to do |format|
  		format.html
  		format.js
  	end		
  end
end
