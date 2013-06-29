class Friendship < ActiveRecord::Base
  attr_accessible :friend_id

  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :user_id, presence: true
  validates :friend_id, presence: true

  def create_for_users(user_a_id, user_b_id)
    user = User.find_by_id(user_a_id)
    user.friendships.create!(friend_id: user_b_id)
  end
end
