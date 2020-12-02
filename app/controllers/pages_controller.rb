class PagesController < ApplicationController
  def home
  	@productions = Production.all.paginate(:page => params[:page], :per_page => 12)
  end

  def help
  end

  def contact
  end
end
