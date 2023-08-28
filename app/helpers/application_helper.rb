module ApplicationHelper

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
end
