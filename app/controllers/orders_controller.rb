# frozen_string_literal: true
class OrdersController < ApplicationController
  include ApplicationHelper
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.user_id = current_user
    @order.status = "pending"
    @current_cart.order_items.each do |item|
      @order.order_items << item
      item.cart_id = nil
    end
    Rails.logger.debug("My object: #{current_user}}")
     if  @order.save
      flash[:true_message]="Created Successfully"
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to order_path(@order)
   else
    flash[:false_message]="Error Occured ! Not Created"
   end
  end

  private
    def order_params
      params.require(:order).permit(:user_id, :status)
    end

end
