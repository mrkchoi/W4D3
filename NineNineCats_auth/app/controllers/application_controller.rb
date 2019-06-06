class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in_user?
  
  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    # create current_user
    @current_user = user
    # set session token
    session[:session_token] = @current_user.session_token
  end

  def logged_in_user?
    current_user.session_token == session[:session_token] if current_user
  end

  def redirect_if_logged_in
    redirect_to cats_url if logged_in_user? 
  end

end
