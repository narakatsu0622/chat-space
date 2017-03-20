class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @users = @group.users
    @messages = @group.messages
  end

  def create
    @message = Message.new(message_params)
    if Message.save
      redirect_to group_messages_path, notice: 'メッセージが投稿されました'
    else
      flash.now[:alert] = 'メッセージを入力してください'
      render action: :index
    end
  end

  private
  def message_params
    params[:user_id] = current_user.id
    params.permit(:body, :image, :group_id, :user_id)
  end
end
