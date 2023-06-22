class PostsController < ApplicationController
  before_action :fetch_author
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @current_user = current_user
  end

  def show
    @post = @user.posts.find(params[:id])
    @current_user = current_user
  end

  def new
    @user = current_user
    @post = Post.new
    @current_user = current_user
  end

  def create
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:success] = 'The post created successfully!'
      redirect_to user_post_url(@user, @post)
    else
      flash[:error] = 'Opps! Something went wrong, please try again'
      redirect_to new_user_post_url(@user)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def fetch_author
    if action_name == 'new'
      @user = current_user
    else
      @user = User.find_by(id: params[:user_id])
      redirect_to root_path, alert: 'User not found' if @user.nil?
      @post = @user.posts.find(params[:id]) if params[:id].present?
    end
  end
end