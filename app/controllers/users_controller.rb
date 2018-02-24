# UsersController
class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end
  
  def my_friends
    @friendships = current_user.friends
  end
  
  def search
    @users = User.search(params[:search_param])
    @users = current_user.except_current_user(@users) if @users.any?
    respond_to do |format|
      format.js
    end
  end
  
  def add_friend
    @friend = User.find(params[:friend])
    current_user.friends << @friend
    redirect_to my_friends_path, notice: 'Friend was successfully added.'
  end
  
  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end
end
