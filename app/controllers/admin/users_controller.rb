class Admin::UsersController < ApplicationController
  before_action :authorize!

  def index
    @users = User.all
  end

  private
  def authorize!
    unless current_user.is_admin?
      redirect_to root_path, notice: "Not Authorized"
    end
  end
end
