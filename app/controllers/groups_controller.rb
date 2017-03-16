class GroupsController < ApplicationController

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
      flash.now[:alert] = 'グループが作成されませんでした'
      render action: :new
    end
  end

  def edit
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end


end
