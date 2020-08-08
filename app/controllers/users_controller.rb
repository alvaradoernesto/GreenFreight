class UsersController < ApplicationController
  def index
  @user = current_user
end

def user_params
  params.require(:user).permit(:name, :email)
end

end
