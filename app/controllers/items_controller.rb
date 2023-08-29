
# frozen_string_literal: true
class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to item_path(@item)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def search
    category_name = params[:category]
    @items = Item.joins(:categories).where(categories: { name: category_name })
  end

  private
    def item_params
      params.require(:item).permit(:title, :description, :price, :photo)
    end
end
