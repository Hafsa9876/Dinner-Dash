# frozen_string_literal: true
class OrderItemsController < ApplicationController

  def create
    chosen_item = Item.find(params[:item_id])
    current_cart = @current_cart

    if current_cart.items.include?(chosen_item)
      @order_item = current_cart.order_items.find_by(item_id: chosen_item.id)
      @order_item.quantity += 1
    else
      @order_item = OrderItem.new
      @order_item.cart = current_cart
      @order_item.item = chosen_item
    end

    if @order_item.save
      flash[:add_item] = "Added Successfully!"
    else
      flash[:reject_item] = "Error!"
    end
    redirect_to cart_path(current_cart)
  end


  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def index
  end

  def add_quantity
    @order_item = OrderItem.find(params[:id])
    @order_item.quantity += 1
    @order_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @order_item = OrderItem.find(params[:id])
    if @order_item.quantity > 1
      @order_item.quantity -= 1
    end
    @order_item.save
    redirect_to cart_path(@current_cart)
  end

  private
    def order_item_params
      params.require(:order_item).permit(:item_id,:quantity, :cart_id)
    end

    def set_default_quantity
      self.quantity ||= 1
    end
end
