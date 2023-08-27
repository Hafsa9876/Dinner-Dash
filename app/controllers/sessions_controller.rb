class SessionsController < ApplicationController
  def create
    puts params[:session]
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:login_success] = "Log In Successfully!"
      redirect_to user_path(@user)
    else
      flash[:missing_error] = "Incorrect Email Or Password"
      render "login"
    end
  end


  def destroy
      session.delete(:user_id)
      @current_user = nil
      redirect_to login_path
  end

end
