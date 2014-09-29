class Admin::UsersController < ApplicationController
  before_action :authorize!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'This punk has been removed.'
  end

  private
  def authorize!
    unless current_user.is_admin?
      redirect_to root_path, notice: "Not Authorized"
    end
  end
end
