class CommentsController < ApplicationController
  before_action :find_post, only: [:create, :destroy]
  before_action :find_comment, only: [:destroy]

  def create
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comments).permit(:name, :comment)
  end

end
