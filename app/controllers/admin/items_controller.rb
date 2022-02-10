class Admin::ItemsController < ApplicationController
  def index
     @item = Item.new
     @items = Item.all
     @items = Item.page(params[:page])
  end

  def new
    @item = Item.new


  end

  def create
    @item = Item.new(item_params)
    p @item
    @item.save
    redirect_to admin_items_path

  end

  def show
     @items = Item.new
     @item= Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.new
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end


   private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :is_active, :image)
  end
end
