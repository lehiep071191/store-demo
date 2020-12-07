class PagesController < ApplicationController
    before_action :authenticate_user!, only: :help 
  def home
  	@productions = Production.all.paginate(:page => params[:page], :per_page => 12)

  end

  def help
  	# @productions = Production.all
  	@productions = Production.limit(6).offset(params[:page])
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user.id)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end


  def contact
  	@productions = Production.all.paginate(page: params[:page], per_page: 6)
  	respond_to do |format|
  		format.html
  		format.js
  	end		
  end
end
