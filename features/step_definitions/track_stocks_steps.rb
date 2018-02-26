When("I go to My Portfolio page") do
  visit '/'
  click_link 'My Portfolio'
end

Then("I can see Search for Stocks form") do
  expect(page).to have_content('Search for Stocks')
end

When("I search for some stock by ticker") do
  fill_in 'stock', with: 'GOOG'
  click_button 'btn-lookup'
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

Then("I should have ability to add {int} stocks to my portfolio") do |int|
  visit '/'
  click_link 'My Portfolio'
  ['FB','BP','DF','RT','GOOG','DD','SA','XESQ','ZC','KLK'].each do |ticker|
    fill_in 'stock', with: ticker
    click_button 'btn-lookup'
    click_link 'Add to my Stocks'
  end
  expect(page).to have_content('Stock KLK was successfully added')
  fill_in 'stock', with: 'P'
  click_button 'btn-lookup'
  expect(page).to have_content('You have added 10 stocks')
end