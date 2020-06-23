class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def make_admin
    @user = User.find(params[:id])
    @user.update_column(:admin,true)
    redirect_to users_url
  end

  def revoke_admin
    @user = User.find(params[:id])
    @user.update_column(:admin,false)
    redirect_to users_url
  end
end
