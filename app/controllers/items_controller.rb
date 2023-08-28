class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to item_path(@item) # Pass the item's ID to the path helper
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
    redirect_to item_path(@item) # Pass the item's ID to the path helper
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path # Redirect to the index action, not show action
  end

  private
    def item_params
      params.require(:item).permit(:title, :description, :price, :photo)
    end
end
