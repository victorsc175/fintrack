require 'rails_helper'

RSpec.describe "user_stocks/new", type: :view do
  before(:each) do
    assign(:user_stock, UserStock.new(
      :user => "",
      :stock => ""
    ))
  end

  it "renders new user_stock form" do
    render

    assert_select "form[action=?][method=?]", user_stocks_path, "post" do

      assert_select "input[name=?]", "user_stock[user]"

      assert_select "input[name=?]", "user_stock[stock]"
    end
  end
end
