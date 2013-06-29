class User < ActiveRecord::Base
  attr_accessible :username

  has_many :friends, through: :friendships
  has_many :friendships, dependent: :destroy
  has_many :friend_of, through: :friendships_of, source: :friend
  has_many :friendships_of, foreign_key: :friend_id, class_name: 'Friendship', dependent: :destroy

  validates :username, presence: true, uniqueness: true
end
