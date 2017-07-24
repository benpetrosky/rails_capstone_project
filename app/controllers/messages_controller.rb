class MessagesController < ApplicationController

def new
  @message = Message.new
  @profile = User.find(params[:user_id])
end

def create
  @message = Message.new(message_params)

  if @message.save
    flash[:notice] = "You have made a message object"
    redirect_to user_path(current_user)
  else
    flash[:alert] = "Eeeh something went wrong"
  end
end

private
  def message_params
    params.require(:message).permit(:sender, :user_id, :content)
  end
end
