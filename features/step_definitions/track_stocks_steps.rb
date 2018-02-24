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

When("I add the stock") do
  click_link 'Add to my Stocks'
end

Then("I should have the stock added to the stock list") do
  expect(page).to have_content('Stock GOOG was successfully added')
end

When("I delete the stock") do
  click_link 'Delete'
end

Then("I should have the stock removed from the stock list") do
  expect(page).to have_content('Stock was successfully removed from portfolio.')
end