class GroceryItemsController < ApplicationController
  def index
    @grocery_items = GroceryItems.all
  end
end
