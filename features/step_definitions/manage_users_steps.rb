When("I go to My Friends page") do
  visit '/'
  click_link 'My Friends'
end

Then("I can see Search for Friends form") do
  expect(page).to have_content('Search for Friends')
end

When("I search for friend by first name") do
  FactoryBot.create :user, email: 'some@email.com',
                           first_name: 'Alex',
                           last_name: 'Black'
  fill_in 'search_param', with: 'Alex'
  find('button', id: 'btn-lookup').trigger('click')
end

Then("I should see user found") do
  expect(page).to have_content('Alex Black')
end

When("I search for friend by last name") do
  FactoryBot.create :user, email: 'some@email.com',
                           first_name: 'Alex',
                           last_name: 'Black'
  fill_in 'search_param', with: 'Black'
  find('button', id: 'btn-lookup').trigger('click')
end

When("I search for friend by email") do
  FactoryBot.create :user, email: 'some@email.com',
                           first_name: 'Alex',
                           last_name: 'Black'
  fill_in 'search_param', with: 'some@email.com'
  find('button', id: 'btn-lookup').trigger('click')
end

When("I add user as a friend") do
  find('a', text: 'Add as my friend').trigger('click')
end

Then("I should see user in My Friends list") do
  expect(page).to have_content('Remove Friend')
end

When("I remove user from friends") do
  FactoryBot.create :user, email: 'some@email.com',
                           first_name: 'Alex',
                           last_name: 'Black'
  fill_in 'search_param', with: 'some@email.com'
  find('button', id: 'btn-lookup').trigger('click')
  find('a', text: 'Add as my friend').trigger('click')
  find('a', text: 'Remove Friend').trigger('click')
end

Then("I should not see user in My Friends list") do
  expect(page).to have_content('You don\'t have any friends yet. Please add some!')
end

When("I view friend's profile") do
  FactoryBot.create :user, email: 'some@email.com',
                           first_name: 'Alex',
                           last_name: 'Black'
  fill_in 'search_param', with: 'some@email.com'
  find('button', id: 'btn-lookup').trigger('click')
  find('a', text: 'Add as my friend').trigger('click')
  click_link 'View Profile'
end

Then("I should see friend's stocks portfolio") do
  expect(page).to have_content('This user is not tracking any stocks')
end