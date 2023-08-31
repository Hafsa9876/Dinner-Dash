# frozen_string_literal: true

# This is Controller
class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.create(item_params)
    authorize @item
    if @item.save
      redirect_to item_path(@item), notice: 'Item created successfully.'
    else
      render :new, notice: 'Not created.'
    end
  end

  def edit
    @item = Item.find(params[:id])
    authorize @item
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    authorize @item
    @item.update(item_params)
    redirect_to item_path(@item), notice: 'Item Updated successfully.'
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item
    @item.destroy
    redirect_to items_path, notice: 'Item deleted successfully.'
  end

  def search
    category_name = params[:category]
    @items = Item.joins(:categories).where(categories: { name: category_name })
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :photo, category_ids: [])
  end
end
