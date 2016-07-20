class SessionsController < ApplicationController
  before_action :unauthenticated_only, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if user = User.authenticate(params[:user][:email], params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in. Welcome back!"
      redirect_to dashboard_path
    else
      flash[:error] = "Bad Username or Password"
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully logged out"
  end

end
