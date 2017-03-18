class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @users = @group.users
    @messages = Message.where(group_id: @group.id)
  end
  def create
    if Message.create(message_params)
      redirect_to group_messages_path
    else
      @messages = Message.all
      render action: :index
    end
  end

  private
  def message_params
    params[:user_id] = current_user.id
    params.permit(:body, :image, :group_id, :user_id)
  end
end
