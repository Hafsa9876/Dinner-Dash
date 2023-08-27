class UsersController < ApplicationController
  before_action :check_if_admin, only: [:destroy]
  def index
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      flash[:success] = "Welcome #{user_params[:full_name]} to Dinner Dash!"
      redirect_to root_path
    else
      flash[:error] = "One or more required fields are missing"
      render "new"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :display_name)
  end

end
