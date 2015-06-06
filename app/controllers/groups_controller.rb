class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show 
    @group = Group.find(params[:id])
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

end