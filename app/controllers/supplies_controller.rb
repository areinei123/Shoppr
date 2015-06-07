class SuppliesController < ApplicationController
  def new 

  end

  def index
    binding.pry
  end

  def create
    @grocery_list = GroceryList.find params["grocery_list_id"]
    Supply.create(:item => params["supply"]["item"], :grocery_list_id => params["grocery_list_id"])
    redirect_to group_path(@grocery_list.group)
  end
end