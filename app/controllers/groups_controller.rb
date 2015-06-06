class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show 
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path
  end
end