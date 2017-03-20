class GroupsController < ApplicationController

  before_action :set_group_new, only: [:new, :create]
  before_action :set_group_update, only: [:edit, :update]

  def new
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
    @group = Group.find(params[:group_id])
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

  def set_group_new
    @group = Group.new
    @users = User.all
  end

  def set_group_update
    @group = Group.find(params[:id])
    @users = User.all
  end

end
