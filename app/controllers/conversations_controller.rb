class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.where(
      'recipient_id = ? OR sender_id = ?',
      current_user.id,
      current_user.id
    ).order('created_at DESC')
    @message = Message.new
  end

  def create
    @conversation = Conversation.create!(conversation_params)
    redirect_to conversations_path
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
