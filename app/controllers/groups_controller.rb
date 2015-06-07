class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @group  = Group.new
  end

  def show
    @group         = Group.find(params[:id])
    @membership    = Membership.find_by(user: current_user, group: @group)
    @grocery_lists = GroceryList.where(group_id: @group.id)
    @grocery_list  = GroceryList.new
    @grocery_items = GroceryItem.where(grocery_list_id: @grocery_lists)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group
    else
      flash[:notice] = @group.errors.full_messages.join("! ")
      render :edit
    end
  end

  def create
    @group  = Group.new(group_params)

    if @group.save
      flash[:notice] = "Group added."
      redirect_to root_path
    else
      @groups = Group.all
      render :index
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group
    else
      flash[:notice] = @group.errors.full_messages.join("! ")
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end

