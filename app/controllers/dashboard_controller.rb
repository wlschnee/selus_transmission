class DashboardController < ApplicationController
  def show
    @user = current_user
    @user_posts = Post.where(user: current_user)
    @other_users = User.paginate(page: params[:page], per_page: 10)
  end
end