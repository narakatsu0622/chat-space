class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: 'メッセージが投稿されました'}
        format.json { render json }
      end
    else
      @group = Group.find(params[:group_id])
      flash.now[:alert] = 'メッセージを入力してください'
      render action: :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
