class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :reactions, dependent: :destroy
end
