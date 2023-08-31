# frozen_string_literal: true

# This is Controller
class OrdersController < ApplicationController
  before_action :require_login, only: [:new, :create]
  skip_before_action :verify_authenticity_token

  def index
    @orders = if current_user.admin?
                Order.all
              else
                current_user.orders
              end

    @orders = @orders.where(status: params[:status]) if params[:status].present?
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
      flash[:notice] = 'Order status updated successfully.'
      redirect_to order_path(@order)
    else
      render :edit
    end
  end

  def create
    @order = build_order
    assign_order_items_to_order
    if save_order
      handle_successful_order_creation
    else
      handle_failed_order_creation
    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy
    flash[:notice] = 'Order deleted successfully.'
    redirect_to orders_path
  end

  def search
    status_name = params[:status]
    @orders = Order.where(status: status_name)
    authorize @orders
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :status)
  end

  def set_orders
    @orders = Order.where(user: current_user)
  end

  def build_order
    Order.new(user_id: current_user.id, status: 'ordered')
  end

  def assign_order_items_to_order
    @current_cart.order_items.each do |item|
      @order.order_items << item
      item.cart_id = nil
    end
  end

  def save_order
    @order.save
  end

  def handle_successful_order_creation
    flash[:true_message] = 'Created Successfully'
    clear_cart_and_session
    redirect_to order_path(@order)
  end

  def handle_failed_order_creation
    flash[:false_message] = 'Error Occurred! Not Created'
  end

  def clear_cart_and_session
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
  end
end
