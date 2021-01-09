class LikesController < ApplicationController
  before_action :set_like

  def create
    user = current_user
    post = Post.find(params[:post_id])
    like = Like.new(user_id: user.id, post_id: post.id)
    redirect_to root_path if like.save
  end
  def destroy
    user = current_user
    post = Post.find(params[:post_id])
    like = Like.find_by(user_id: user.id, post_id: post.id)
    redirect_to root_path if like.delete
  end

  private

    def set_like
    @post = Post.find(params[:post_id])
    end
end
