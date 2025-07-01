class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.by_score.limit(30)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user, :reactions).recent
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
