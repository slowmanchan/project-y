class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.where(
      'recipient_id = ? OR sender_id = ?',
      current_user.id,
      current_user.id
    ).order('created_at DESC')
end

  def create
    @conversation = Conversation.create!(conversation_params)
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
