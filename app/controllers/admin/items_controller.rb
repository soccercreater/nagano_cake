class Admin::ItemsController < ApplicationController
  def index
     @item = Item.new
  end

  def new
    @item = Item.new


  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to '/'

  end

  def show
     @items = Item.new
  end

  def edit
  end

  def update
  end


   private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id)
  end
end
