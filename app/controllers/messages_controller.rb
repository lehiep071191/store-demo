class MessagesController < ApplicationController
  def create
    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    if @message.save!
    	ActionCable.server.broadcast "message_channel", 
    									user: @message.user.id.to_i,
										content: @message.body,
										id: @message.conversation.id
	end									
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :body)
  end
end
