class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @users = @group.users
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: 'メッセージが投稿されました'
    else
      @group = Group.find(params[:group_id])
      flash.now[:alert] = 'メッセージを入力してください'
      render action: :index
    end
  end

  private
  def message_params
    params[:user_id] = current_user.id
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
