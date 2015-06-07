class GroceryItemsController < ApplicationController
  def index
  end

  def edit
    @grocery_list = GroceryList.find(params[:grocery_list_id])
    @grocery_item = GroceryItem.find(params[:id])
  end

  def update
    @grocery_list = GroceryList.find(params[:grocery_list_id])
    @grocery_item = GroceryItem.find(params[:id])
    @group = @grocery_list.group

    if @grocery_item.update(grocery_item_params)
      flash[:notice] = "Item has been updated."
      redirect_to group_path(@group)
    else
      flash[:notice] = @grocery_item.errors.full_messages.join("! ")
      render :edit
    end
  end

  private

  def grocery_item_params
    params.require(:grocery_item).permit(:name, :expiration_date, :quantity)
  end
end
