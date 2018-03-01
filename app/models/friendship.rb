class Friendship < ApplicationRecord
  validates_presence_of :user, :friend
  validates_uniqueness_of :user_id, scope: :friend_id
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
