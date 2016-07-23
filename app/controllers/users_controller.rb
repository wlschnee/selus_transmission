class UsersController < ApplicationController
  before_action :select_user, only: [:show, :update]

  def index
    @users = User.all
  end

  def show
  end

  def update
    if params[:admin]
      @user.toggle_admin
    end
    redirect_to :dashboard
  end

  private

  def select_user
    @user = User.find(params[:id])
  end
end
