require 'rails_helper'

RSpec.describe "user_stocks/show", type: :view do
  before(:each) do
    @user_stock = assign(:user_stock, UserStock.create!(
      :user => "",
      :stock => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
