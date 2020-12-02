class Admin::OrdersController < Admin::ApplicationController



	def index
		val = if params[:val] == "oldest"
	            "oldest"
	         else
	             "newest"
	         end

		if params[:type].present?
			@orders = Order.send(params['type']).paginate(:page => params[:page], :per_page => 20)
			@type = params[:type]		
		else
			@orders = Order.all.order_by_time(val).paginate(:page => params[:page], :per_page => 20)			
	    end	
	    @order_status = Order.order_statuses.reject{|k| k == "Canceled by buyer"}
	end
	def show
		@order = Order.find_by id: params[:id]
		@order_details = @order.order_details
	end	
	
	
	def update		
		pr = params[:id].split(",").map{ |id| id.to_i }
		

		if Order.update(pr, pr.map{ |id| {order_status: params[:order_status].to_i}})
			render json: {   
	        update_data_order: Order.find_by(id: pr.first).order_status
	    }, status: :ok  
		end
	end	
end	