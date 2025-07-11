class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  
  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    
    if @comment.save
      redirect_to @post, notice: 'Comment added successfully'
    else
      redirect_to @post, alert: 'Error adding comment.'
    end
  end
  
  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
