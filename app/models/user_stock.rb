class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  after_create_commit { SendNewPriceJob.perform_later self.stock }
end
