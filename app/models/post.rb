class Post < ApplicationRecord
   # Associations
   has_many :comments
   has_many :votes
   
   # Validations
   validates :title, presence: true
   validates :hackernews_id, uniqueness: true
   
   # Scopes
   scope :by_score, -> { order(score: :desc) }
   scope :recent, -> { order(published_at: :desc) }
end
