class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def set_nick
    @user = current_user
  end

  def update
    @user = current_user
    @user.nickname = params[:user][:nickname]
    if @user.save
      redirect_to 'chatrooms/1'
    else
      render :set_nick
    end
  end
private
def user_params
  params.require(:user).permit(:name, :email, :nickname)
end

end
