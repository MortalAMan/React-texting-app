class Api::MessagesController < ApplicationController
  def all_messages
    render json: ChatMessage.all
  end

  def create
    message = ChatMessage.new(chat_message_params)
    if message.save
      MessageBus.publish '/chat_channel', { email: message.email, body: message.body }
    else
      render json: { error: 'Error creating message' }, status: :bad_request
    end
  end

  private
    def chat_message_params
      # { chat_message: { email: 'jake@test.com', body: 'test' } } 
      params.require(:chat_message).permit(:email, :body)
    end
end
