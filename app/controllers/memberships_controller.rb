class MembershipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @group = Group.find(params[:group_id])
    @membership = Membership.new(user: current_user, group: @group)
    if @membership.save
      flash[:notice] = "You have joined the group!"
    end

    redirect_to @group
  end

  def destroy
    @group = Group.find(params[:group_id])
    @membership = Membership.find_by(user: current_user, group: @group)

    if @membership.destroy
      flash[:notice] = "You have left the group."
      redirect_to @group
    end
  end
end
