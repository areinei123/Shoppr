class ReceiptsController < ApplicationController
  def index
    @grocery_list = GroceryList.find(params[:grocery_list_id])
    @receipt = Receipt.new
  end

  def create
    @grocery_list = GroceryList.find(params[:grocery_list_id])
    @group = @grocery_list.group
    @membership = Membership.find_by(group_id: @group, user_id: current_user.id)
    @receipt = Receipt.create(:img_url => params["receipt"]["img_url"], :date => params["receipt"]["date"], :membership_id => @membership.id, :grocery_list_id => @grocery_list.id)
    redirect_to grocery_list_receipts_path(@grocery_list)
  end
end

