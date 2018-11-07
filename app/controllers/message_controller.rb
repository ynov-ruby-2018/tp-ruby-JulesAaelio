class MessageController < ApplicationController

  before_action :authenticate_user!

  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(post_params)

    if @message.save
      redirect_to message_index_path
    end
  end

  def post_params
    params.require(:message).permit(
        :content,
    ).merge(user_id: current_user.id)
  end
end
