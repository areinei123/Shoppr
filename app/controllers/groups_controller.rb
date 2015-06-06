class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @group  = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "Group added."
      redirect_to root_path
    else
      render :index
    end
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
