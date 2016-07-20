class RegistrationsController < ApplicationController
  before_action :unauthenticated_only, only: [:new, :create]
  before_action :authenticated_only, only: [:edit, :update]
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "Successful registration and login"
    else
      flash[:error] = "This email is already registered"
      redirect_to registrations_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.update(user_params)
    if user.save
      redirect_to dashboard_path, notice: "Successfully updated your account"
    else
      flash[:error] = "Check again, all fields are required"
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
