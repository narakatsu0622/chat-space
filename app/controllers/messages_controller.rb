class MessagesController < ApplicationController
  before_action :set_group
  before_action :set_messages
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @groups = current_user.groups
    @add_messages = @group.messages.after_id(params[:last_message_id])
    respond_to do |format|
      format.html
      format.json { render "update_message.json.jbuilder" }
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: 'メッセージが投稿されました'}
        format.json { render "message_index.json.jbuilder" }
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

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages.includes(:user)
  end

end
