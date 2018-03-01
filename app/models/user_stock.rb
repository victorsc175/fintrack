class UserStock < ApplicationRecord
  validates_presence_of :user, :stock
  validates_uniqueness_of :user_id, scope: :stock_id
  belongs_to :user
  belongs_to :stock
end
