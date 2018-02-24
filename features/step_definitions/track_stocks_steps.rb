When("I go to My Portfolio page") do
  visit '/'
  click_link 'My Portfolio'
end

Then("I can see Search for Stocks form") do
  expect(page).to have_content('Search for Stocks')
end

When("I search for some stock by ticker") do
  fill_in 'stock', with: 'GOOG'
  click_button 'Look up a stock'
end

Then("I should see ticker details") do
  expect(page).to have_content('Alphabet')
end
