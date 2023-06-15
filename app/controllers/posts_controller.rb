class PostsController < ApplicationController
  before_action :fetch_author

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  private

  def fetch_author
    @user = User.find_by(id: params[:user_id])

    redirect_to root_path, alert: 'User not found' if @user.nil?

    @post = @user.posts.find(params[:id]) if params[:id].present?
  end
end
