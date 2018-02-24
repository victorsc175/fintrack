When("I go to My Friends page") do
  visit '/'
  click_link 'My Friends'
end

Then("I can see Search for Friends form") do
  expect(page).to have_content('Search for Friends')
end