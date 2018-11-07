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

  def like
    @message = Message.find(params[:id])
    if @message.likes == nil
      @message.update({likes: 1})
    else
      @message.update({likes: @message.likes + 1})
    end

    redirect_to message_index_path
  end

  def dislike
    @message = Message.find(params[:id])
    if @message.dislikes == nil
      @message.update({dislikes: 1})
    else
      @message.update({dislikes: @message.dislikes + 1})
    end

    redirect_to message_index_path
  end



end
