class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
    go_to_main_chat
  end

  def authenticate_user
    redirect_to(:sign_in) unless current_user.present?
  end

  def go_to_main_chat
    redirect_to(chats_main_path)
  end
end
