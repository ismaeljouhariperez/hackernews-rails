class Post < ApplicationRecord
   # Associations
   has_many :comments, dependent: :destroy
   has_many :votes, dependent: :destroy
   
   # Validations
   validates :title, presence: true
   validates :author, presence: true
   validates :hackernews_id, uniqueness: { allow_nil: true }
   validates :score, presence: true, numericality: { greater_than_or_equal_to: 0 }
   
   # Scopes
   scope :by_score, -> { order(score: :desc) }
   scope :recent, -> { order(published_at: :desc) }
end
