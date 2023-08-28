module ApplicationHelper
  #helper_method :current_user, :logged_in?

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
  end

  def log_out
    session[:user_id] = nil
    session[:cart_id] = nil
  end

  def require_login
     if logged_in?
      session[:user_id]
     else
      flash[:error] = "You must be logged in to access this page."
      redirect_to login_path
    end
  end

end
