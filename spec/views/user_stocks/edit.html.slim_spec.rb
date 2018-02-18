require 'rails_helper'

RSpec.describe "user_stocks/edit", type: :view do
  before(:each) do
    @user_stock = assign(:user_stock, UserStock.create!(
      :user => "",
      :stock => ""
    ))
  end

  it "renders the edit user_stock form" do
    render

    assert_select "form[action=?][method=?]", user_stock_path(@user_stock), "post" do

      assert_select "input[name=?]", "user_stock[user]"

      assert_select "input[name=?]", "user_stock[stock]"
    end
  end
end
