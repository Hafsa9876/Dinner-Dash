# frozen_string_literal: true

# This is Controller
class OrderItemsController < ApplicationController
  def create
    chosen_item = Item.find(params[:item_id])
    current_cart = @current_cart
    @order_item = find_or_initialize_order_item(current_cart, chosen_item)

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

  def add_quantity
    @order_item = OrderItem.find(params[:id])
    @order_item.quantity += 1
    @order_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @order_item = OrderItem.find(params[:id])
    @order_item.quantity -= 1 if @order_item.quantity > 1
    @order_item.save
    redirect_to cart_path(@current_cart)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:item_id, :quantity, :cart_id)
  end

  def set_default_quantity
    self.quantity ||= 1
  end

  def find_or_initialize_order_item(cart, item)
    if cart.items.include?(item)
      order_item = cart.order_items.find_by(item_id: item.id)
      order_item.quantity += 1
    else
      order_item = OrderItem.new(cart: cart, item: item)
    end
    order_item
  end
end
