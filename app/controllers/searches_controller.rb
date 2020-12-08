class SearchesController < ApplicationController
  def index
  	q = params[:q]
  	if q
  		user_name = User.ransack(fullname_cont: q).result
  		production_name = Production.ransack(name_cont: q).result
  		@searches =  production_name + user_name
	  	render json: {
	  		data_search: render_to_string(@searches)
	  	}
	end
  end
end
