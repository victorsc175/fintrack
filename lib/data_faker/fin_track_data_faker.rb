module FinTrackDataFaker
  # Populate blog fake data
  class Builder
    USERS = 10
    DEFAULT_PASSWORD = 'fintrack'
    FRIENDSHIPS = 50
    STOCKS = 10
    USER_STOCKS = 80
    CLEAR_DATA = [User, Friendship, Stock, UserStock].freeze

    class << self
      def create_data
        destroy_old_data
        create_users
        create_friendships
        create_stocks
        create_user_stocks
      end

      def destroy_old_data
        CLEAR_DATA.each(&:destroy_all)
      end

      def create_users
        USERS.times { user.save! }
      end
      
      def create_friendships
        users = User.all
        FRIENDSHIPS.times do
          user = users.sample
          friend = users.sample
          unless user.friends.include? friend
            Friendship.create! user: user,
                               friend: friend
          end
        end
      end
      
      def create_stocks
        data = [
          ['FB', 'Facebook Inc',  173.29],
          ['GOOG', 'Alphabet Inc', 1053.08],
          ['P', 'Pandora Media Inc',  4.23],
          ['RT', 'Ruby Tuesday, Inc.',  0.0],
          ['AAPL', 'Apple Inc.',  172.8],
          ['TT', 'TUI Travel Ltd', 0.0],
          ['PP', 'Pacific Potash Corp', 0.05],
          ['RE', 'Everest Re Group Ltd', 237.34],
          ['IT', 'Gartner Inc', 113.07],
          ['IR', 'Ingersoll-Rand PLC', 85.1]
        ]
        data.each do |stock|
          Stock.create! ticker: stock[0],
                       name: stock[1],
                       last_price: stock[2]
        end
      end
      
      def create_user_stocks
        users = User.all
        stocks = Stock.all
        USER_STOCKS.times do
          user = users.sample
          stock = stocks.sample
          unless user.stocks.include? stock
            UserStock.create! user: user,
                               stock: stock
          end
        end
      end

      def user
        username = FFaker::Name.name
        first_name = username.split.first
        last_name = username.split.last
        User.new first_name: first_name,
                 last_name: last_name,
                 email: email(username),
                 password: DEFAULT_PASSWORD
      end

      def email(username)
        username.downcase.split.join('.') +
          '@' +
          FFaker::Company.bs.split.first +
          '.com'
      end

      def password(username)
        email(username)
      end
    end
  end
end
