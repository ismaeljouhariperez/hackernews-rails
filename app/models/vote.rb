class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Validations
  validates :user_id, uniqueness: { scope: :post_id, message: "Vous ne pouvez voter qu'une fois par post" }

  # Callbacks
  after_create :update_post_score
  after_destroy :update_post_score

  private

  def update_post_score
    # Met à jour le score du post en fonction du nombre de votes
    post.update!(score: post.votes.count)
  end
end
