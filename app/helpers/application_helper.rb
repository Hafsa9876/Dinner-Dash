# frozen_string_literal: true

module ApplicationHelper
 def require_login
    unless user_signed_in?
      flash[:error] = 'You must be logged in to access this page.'
      redirect_to new_user_session_path
    end
  end
end
