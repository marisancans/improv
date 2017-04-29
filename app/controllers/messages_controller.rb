class MessagesController < ApplicationController
  def create
    message = current_user.messages.build(message_params)
    render_message(message) if message.save
  end
  
  def speak
    
  end
  
  private
  
    def message_params
      params.require(:message).permit(:content).merge(user_id: current_user.id)
    end
    
    def render_message(message)
      render(partial: 'message', locals: { message: message })
    end
    
end