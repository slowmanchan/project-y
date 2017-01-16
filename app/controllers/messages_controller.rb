class MessagesController < ApplicationController
  before_action :setup_conversation

  def index
    @messages = @conversation.messages
    @message = Message.new

    respond_to do |format|
      format.html { render 'messages/index' }
      format.js
    end
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)

    if @message.save

      respond_to do |format|
        format.html { redirect_to conversation_messages_path(@conversation) }
        format.js
      end
    end
  end

  private

  def setup_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
