class PostsController < ApplicationController
  before_action :fetch_author

  def index
    @posts = @user.posts
    @current = current_user
  end

  def show
    @post = @user.posts.find(params[:id])
    @current = current_user

  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      flash[:success] = 'The post created successfully!'
      redirect_to user_post_url(current_user, @post)
    else
      flash[:error] = 'Opps! Something went wrong, please try again'
      redirect_to new_user_post_url(current_user)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def fetch_author
    @user = User.find_by(id: params[:user_id])

    redirect_to root_path, alert: 'User not found' if @user.nil?

    @post = @user.posts.find(params[:id]) if params[:id].present?
  end
end
