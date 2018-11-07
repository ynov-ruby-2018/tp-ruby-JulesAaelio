class MessageController < ApplicationController

  before_action :authenticate_user!

  def index
    @messages = Message.last(5).reverse
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

  def like
    @message = Message.find(params[:id])
    @message.update({likes: @message.likes + 1})
    redirect_to message_index_path
  end

  def dislike
    @message = Message.find(params[:id])
    @message.update({dislikes: @message.dislikes + 1})
    redirect_to message_index_path
  end
end
