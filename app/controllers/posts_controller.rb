class PostsController < ApplicationController
  before_action :select_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticated_only, only: [:new, :create, :edit, :update, :destroy]
  def index
    @posts = Post.all.order('created_at desc').limit(10)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "Post successfully saved"
      redirect_to posts_path(@post)
    else
      flash[:error] = "Post not saved"
      redirect_to :back
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    flash[:success] = "Post successfully saved"
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to dashboard_path
  end

  private

  def select_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end


end
