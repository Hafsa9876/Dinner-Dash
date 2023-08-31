# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{user_params[:full_name]} to Dinner Dash!"
      redirect_to root_path
    else
      flash[:error] = 'One or more required fields are missing'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def index
    @users = User.all
    authorize @users
  end

  def edit
   @user = User.find(params[:id])
   authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :display_name)
  end
end
