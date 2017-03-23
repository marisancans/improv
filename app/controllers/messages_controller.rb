class MessagesController < ApplicationController
  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'chat_room_channel',
                                   message: render_message(message)
    end
  end
  
  private
  
    def message_params
      params.require(:message).permit(:content)
    end
    
    def render_message(message)
      render(partial: 'message', locals: { message: message })
    end
    
end