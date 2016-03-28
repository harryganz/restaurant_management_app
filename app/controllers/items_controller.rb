class ItemsController < ApplicationController

  def index
    @appetizers = Item.in_category('appetizer').by_name
    @salads = Item.in_category('salad').by_name
    @entrees = Item.in_category('entree').by_name
    @beverages = Item.in_category('beverage').by_name
    @desserts = Item.in_category('dessert').by_name
  end

end
