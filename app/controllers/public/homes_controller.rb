class Public::HomesController < ApplicationController
  def top
     @items = Item.all
     @items = @items.limit(4).order(" created_at DESC ")
  end

  def about
  end
end
