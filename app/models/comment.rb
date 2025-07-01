class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # Associations
  has_many :reactions, dependent: :destroy

  # Validations
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }

  # Scopes
  scope :recent, -> { order(created_at: :desc) }
end