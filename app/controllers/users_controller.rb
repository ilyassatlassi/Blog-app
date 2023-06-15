class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @user_posts = @user.posts.order(created_at: :desc)
  end
end
