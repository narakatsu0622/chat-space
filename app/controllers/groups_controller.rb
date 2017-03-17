class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def index
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループが作成されました'
    else
      flash.now[:alert] = 'グループ名を入力してください'
      render action: :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループが更新されました'
    else
      flash.now[:alert] = 'グループが更新されませんでした'
      render :edit
    end

  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
  def set_group
    @group = Group.find(params[:id])
  end


end
