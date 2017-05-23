class SessionsController < PublicController
  def new
    current_user.present? ? go_to_main_chat : @user = User.new
  end

  def create
    user = User.find_by(username: session_params[:username])
    if user && user.authenticate(session_params[:password])
      log_in(user)
    else
      @login_error = 'Incorrect username/password combo'
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
