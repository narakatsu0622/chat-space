class UsersController < ApplicationController

  def index
    @user = User.where('name LIKE ?', "%#{params[:user_name]}%")
    render 'user_list', formats: [:json], handlers: [:jbuilder]
  end
end
