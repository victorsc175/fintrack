require 'rails_helper'

RSpec.describe "user_stocks/index", type: :view do
  before(:each) do
    assign(:user_stocks, [
      UserStock.create!(
        :user => "",
        :stock => ""
      ),
      UserStock.create!(
        :user => "",
        :stock => ""
      )
    ])
  end

  it "renders a list of user_stocks" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
