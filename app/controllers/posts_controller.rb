class PostsController < ApplicationController
  before_action :fetch_author

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end
  
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_posts_path(current_user)

    else
      flash[:alert] = 'Something went wrong'
      render 'new'
    end
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def fetch_author
    @user = User.find_by(id: params[:user_id])

    redirect_to root_path, alert: 'User not found' if @user.nil?

    @post = @user.posts.find(params[:id]) if params[:id].present?
  end
end
