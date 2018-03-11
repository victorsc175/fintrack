# User model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  EMAIL_MATCHER = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :first_name, length: { maximum: 20 }
  validates :last_name, length: { maximum: 20 }
  validates :email, presence: true,
                    length: { maximum: 45 },
                    uniqueness: true,
                    format: { with: EMAIL_MATCHER,
                              message: 'Invalid email' }
  has_many :user_stocks, dependent: :destroy
  has_many :stocks, through: :user_stocks
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  def self.demo
    user = User.offset(rand(User.count)).limit(1).first
    user.update(password: 'fintrack')
    user
  end

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    'Anonymous'
  end

  def can_add_stock?(ticker)
    under_stock_limit? && !stock_already_added?(ticker)
  end

  def under_stock_limit?
    user_stocks.count < 10
  end

  def stock_already_added?(ticker)
    stock = Stock.find_by_ticker(ticker)
    stock && user_stocks.where(stock_id: stock.id).any?
  end

  def not_friends_with?(friend_id)
    friendships.where(friend_id: friend_id).count < 1
  end

  def except_current_user(users)
    users.reject { |user| user.id == id }
  end

  def self.search(param)
    return User.none if param.blank?
    param.strip!
    param.downcase!
    (first_name_matches(param) +
      last_name_matches(param) +
      email_matches(param)).uniq
  end

  def self.first_name_matches(param)
    where("lower(first_name) like ?", "%#{param}%")
  end

  def self.last_name_matches(param)
    where("lower(last_name) like ?", "%#{param}%")
  end

  def self.email_matches(param)
    where("lower(email) like ?", "%#{param}%")
  end
end
