class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :firend, class_name: :user
end
