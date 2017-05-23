class UsersController < PublicController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save ? go_to_main_chat : render(:new)
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end