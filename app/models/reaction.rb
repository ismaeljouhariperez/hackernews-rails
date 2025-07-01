class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  # 🎯 Enum pour les emojis autorisés
  enum emoji: {
    thumbs_up: 0,      # 👍
    thumbs_down: 1,    # 👎  
    heart: 2,          # ❤️
    fire: 3,           # 🔥
    rocket: 4,         # 🚀
    eyes: 5,           # 👀
    laugh: 6,          # 😂
    confused: 7,       # 😕
    party: 8           # 🎉
  }
  
  # Validations
  validates :user_id, uniqueness: { scope: [:comment_id, :emoji] }

  # Scopes
  scope :positive, -> { where(emoji: [thumbs_up, heart, rocket, eyes, laugh, party]) }
  scope :negative, -> { where(emoji: [thumbs_down, fire, confused]) }
  scope :recent, -> { order(created_at: :desc) }
end
