class GroupsController < ApplicationController
  before_action :authenticate_user!
  
  
  def new
    @group = Group.new
  end
  
  def index  #I wanted to index everything here
    @groups = current_user.groups
    @users = User.all.where("id != ?", current_user.id)
  end

  def create
    @user = current_user
    @group = @user.groups.new(group_param)
    if @group.save
      Membership.create(user: @user, group: @group)
      flash[:success] = 'New group was succesfully created.'
      redirect_to @group
    else
      render 'new'
    end
  end
  
  def show
    @group = Group.find(params[:id])
  end

  #I might wanna create some strong parameters here
  def invite
    @group = Group.find(params[:id])
    @users = User.where(id: params[:group][:user_ids])
    @users.each do |user|
      @join = Membership.create(group_id: @group.id, user_id: user.id)
    end
    redirect_to root_url
  end


private

  def group_param
    params.require(:group).permit(:group_name, :user_ids =>[])
  end

end