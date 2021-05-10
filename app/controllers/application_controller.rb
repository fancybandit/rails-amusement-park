class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_if_not_logged_in
    redirect_to root_path if !session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
