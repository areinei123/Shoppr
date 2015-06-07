class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.where(grocery_list: params[:grocery_list_id])
  end
end
