class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Validations
  validates :user_id, uniqueness: { scope: :post_id, message: "Vous ne pouvez voter qu'une fois par post" }

  # Callbacks
  after_create :increment_post_score
  after_destroy :decrement_post_score

  private

  def increment_post_score
    post.increment!(:score)
  end

  def decrement_post_score
    post.decrement!(:score)
  end
end
