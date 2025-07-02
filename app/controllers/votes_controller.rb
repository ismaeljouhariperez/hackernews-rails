class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    vote = @post.votes.find_by(user: current_user)
    
    if vote
      vote.destroy
      redirect_to root_path, notice: "Vote removed!"
    else
      @post.votes.create!(user: current_user)
      redirect_to root_path, notice: "Thanks for your vote!"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
