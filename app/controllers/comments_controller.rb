class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!
    redirect_to @post
  end

  private

  def comments
    params.require(:comment)
  end
end
