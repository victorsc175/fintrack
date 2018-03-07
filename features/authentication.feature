Feature: Authentication system, users can sign-up, edit their profile, log in and log out

  In order to follow authentication requirements
  As a guest
  I need to have ability to sign-up, edit their profile, log in and log out
  
    Scenario: sign up
      Given I am a guest user
      When I go to Welcome page
      And I click on Log in link
      And I click on Sign up link
      And I fill in sign up details
      Then I get new user registered
      
    Scenario: sign up with incorrect parameters
      Given I am a guest user
      When I go to Welcome page
      And I click on Log in link
      And I click on Sign up link
      And I fill in sign up with wrong details
      Then I get user registration error
  
    Scenario: log in
      Given I am a guest user
      When I go to Welcome page
      And I click on Log in link
      And I click on Sign up link
      And I fill in sign up details
      Then I get user logged in
      
    Scenario: log in with incorrect parameters
      Given I am a guest user
      When I have user account created
      And I go to Welcome page
      And I click on Log in link
      And I fill in credentials with wrong details
      Then I should stay on Log in page
      
    Scenario: edit profile
      Given I am a logged in user
      And I go to My Profile page
      Then I can change profile details
      
    Scenario: log out
      Given I am a logged in user
      And I log out
      Then I should be logged out
