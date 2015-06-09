class ReceiptsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @grocery_list = GroceryList.find(params[:grocery_list_id])
    @receipt = Receipt.new
    @receipts = Receipt.where(grocery_list: params[:grocery_list_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @grocery_list = GroceryList.find(params[:grocery_list_id])
    @membership = Membership.find_by(group: @group, user: current_user)
    @receipt = Receipt.new(receipt_params)
    @receipt.membership = @membership
    @receipt.grocery_list = @grocery_list

    if @receipt.save
      flash[:notice] = "Receipt Created!"
    end

    redirect_to group_grocery_list_receipts_path(@group, @grocery_list)
  end

  private

  def receipt_params
    params.require(:receipt).permit(:photo)
  end
end
