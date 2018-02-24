Given("I am a guest user") do
  # user is not logged in yet
end

When("I go to Welcome page") do
 visit '/'
end

When("I click on Sign up link") do
  click_link 'Sign up'
end

When("I fill in sign up details") do
  fill_in 'Email', with: 'victor@email.com'
  fill_in 'First name', with: 'Victor'
  fill_in 'Last name', with: 'S'
  fill_in 'Password', with: 'testpassword'
  fill_in 'Password confirmation', with: 'testpassword'
  click_button 'Sign up'
end

Then("I get new user registered") do
  expect(page).to have_content('Welcome! You have signed up successfully.')
end

When("I fill in sign up with wrong details") do
  fill_in 'Email', with: ''
  fill_in 'First name', with: 'Victor'
  fill_in 'Last name', with: 'S'
  fill_in 'Password', with: 'testpassword'
  fill_in 'Password confirmation', with: 'testpassword'
  click_button 'Sign up'
end

Then("I get user registration error") do
  expect(page).to have_content('error')
end

When("I have user account created") do
  FactoryBot.create :user
end

When("I fill in credentials") do
  fill_in 'Email', with: 'posted@email.com'
  fill_in 'Password', with: 'specmanager'
  click_button 'Log in'
end

Then("I get user logged in") do
  expect(page).to have_content('Signed in successfully.')
end

When("I fill in credentials with wrong details") do
  fill_in 'Email', with: 'fake@email.com'
  fill_in 'Password', with: 'specmanager'
  click_button 'Log in'
end

Then("I should stay on Log in page") do
  expect(page).to have_content('Invalid Email or password.')
end

Given("I am a logged in user") do
  FactoryBot.create :user
  visit '/'
  fill_in 'Email', with: 'posted@email.com'
  fill_in 'Password', with: 'specmanager'
  click_button 'Log in'
end

When("I go to My Profile page") do
  click_link 'My Profile'
end

Then("I can change profile details") do
  fill_in 'First name', with: 'Changed'
  fill_in 'Current password', with: 'specmanager'
  click_button 'Update'
  expect(page).to have_content('Your account has been updated successfully.')
end

Given("I log out") do
  click_link 'Logout'
end

Then("I should be logged out") do
  expect(page).to have_content('You need to sign in or sign up before continuing.')
end