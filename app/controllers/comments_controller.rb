class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(post_comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referer
    else
      @post_new = Book.new
      @comments = @post.comments
      redirect_to new_post_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
