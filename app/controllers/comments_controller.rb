class CommentsController < ApplicationController
    def new
      @user = current_user
      @post = Post.find(params[:post_id])
      @comment = Comment.new
    end
  
    def create
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.build(comment_params)
      @comment.post = @post
  
      if @comment.save
        flash[:success] = 'Comment created!'
        redirect_to user_post_path(@post.author, @post)
      else
        flash[:error] = 'Comment not created'
        render 'posts/show'
      end
    end
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end