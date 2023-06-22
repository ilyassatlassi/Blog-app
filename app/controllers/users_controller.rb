class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @user_posts = @user.posts.order(created_at: :desc)
    @current_user = current_user
  end
end
