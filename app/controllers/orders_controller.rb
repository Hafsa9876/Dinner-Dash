# frozen_string_literal: true
class OrdersController < ApplicationController

  before_action :require_login, only: [:new, :create]
  skip_before_action :verify_authenticity_token

  def index
    if current_user.admin?
      @orders = Order.all
    else
      @orders = current_user.orders
    end
    if params[:status].present?
      @orders = @orders.where(status: params[:status])
    end
    #authorize @orders
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def new
    @order = Order.new
  end
  def edit
    @order = Order.find(params[:id])
    authorize @order
  end

  def update
    @order = Order.find(params[:id])
    authorize @order
    status_name = params[:status]
    if @order.update(status: status_name)
      flash[:notice] = "Order status updated successfully."
      redirect_to order_path(@order)
    else
      render :edit
    end
  end

  def create
    @order = Order.new
    @order.user_id = require_login
    @order.status = "ordered"
    @current_cart.order_items.each do |item|
      @order.order_items << item
      item.cart_id = nil
    end
    #puts "My object: #{require_login}}"
    if  @order.save
      flash[:true_message]="Created Successfully"
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to order_path(@order)
    else
      flash[:false_message]="Error Occured ! Not Created"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy
    flash[:notice] = "Order deleted successfully."
    redirect_to orders_path
  end


  def search
    status_name = params[:status]
    @orders = Order.where(status: status_name )
    authorize @orders
  end

  private
    def order_params
      params.require(:order).permit(:user_id, :status)
    end

    def set_orders
      @orders = Order.where(user: current_user)
    end

end
