class GroupsController < ApplicationController

  def new
    @group = Group.new
    @users = User.all
  end

  def index
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: 'グループが作成されました'
    else
      flash.now[:alert] = 'グループ名を入力してください'
      render action: :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループが更新されました'
    else
      flash.now[:alert] = 'グループが更新されませんでした'
      render edit_group_path(@group)
    end

  end

  private
  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end

end
