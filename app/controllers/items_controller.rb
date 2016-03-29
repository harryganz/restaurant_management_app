class ItemsController < ApplicationController

  @@categories = %w(appetizer entree beverage salad dessert) #TODO Move this to db

  def index
    @appetizers = Item.in_category('appetizer').by_name
    @salads = Item.in_category('salad').by_name
    @entrees = Item.in_category('entree').by_name
    @beverages = Item.in_category('beverage').by_name
    @desserts = Item.in_category('dessert').by_name
  end

  def new
    @item = Item.new
    @categories = @@categories
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      redirect_to new_item_path
    end

  end

  def edit
    @item = Item.find(params[:id])
    @categories = @@categories
  end

  def update
    @item = Item.find(params[:id])
    if(@item.update(item_params))
      redirect_to items_path
    else
      redirect_to edit_item_path
    end
  end

  def destroy
    if Item.find(params[:id]).destroy
      redirect_to items_path
    else
      redirect_to edit_item_path(params[:id])
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description,
    :category, :price)
  end

end
