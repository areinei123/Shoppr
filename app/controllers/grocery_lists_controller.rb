class GroceryListsController < ApplicationController
  def index

  end
  
  def create
    @group = Group.find params["group_id"]
    GroceryList.create(:name => params["grocery_list"]["name"], :group_id => params["group_id"])
    redirect_to group_path(@group)
  end
end
