class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def set_nick
    @user = current_user
    # @chatroom = Chatroom.first
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to "/chatrooms/1"
    else
      render :set_nick
    end
  end
private
def user_params
  params.require(:user).permit(:name, :email, :nickname)
end
end
