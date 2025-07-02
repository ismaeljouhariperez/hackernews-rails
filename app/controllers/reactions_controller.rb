class ReactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment
  
  def create
    reaction = @comment.reactions.find_by(
      user: current_user, 
      emoji: params[:emoji]
    )

    if reaction
      reaction.destroy
    else
      @comment.reactions.create!(
        user: current_user,
        emoji: params[:emoji]
      )
    end
    
    redirect_to @comment.post
  end
  
  private
  
  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end