# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:login_success] = 'Log In Successfully!'
      redirect_to root_path
    else
      flash[:missing_error] = 'Incorrect Email Or Password'
      render "login"
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:cart_id)
    @current_user = nil
    flash[:logout_success] = 'Log Out Successfully!'
    redirect_to root_path
  end
end
