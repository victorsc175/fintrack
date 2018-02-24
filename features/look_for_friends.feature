Feature: Users can look for friends, or other users of the app, by name (first, last) or email

  In order to manage friends
  As a logged in user
  I need to have ability look for friends, or other users of the app, by name (first, last) or email
  
    Scenario: view My friends page
    Given I am a logged in user
    When I go to My Friends page
    Then I can see Search for Friends form
    
  @javascript
    Scenario: look for friend by first name
    Given I am a logged in user
    When I go to My Friends page
    And I search for friend by first name
    Then I should see user found

  @javascript
    Scenario: look for friend by last name
    Given I am a logged in user
    When I go to My Friends page
    And I search for friend by last name
    Then I should see user found
    
  @javascript
    Scenario: look for friend by email
    Given I am a logged in user
    When I go to My Friends page
    And I search for friend by email
    Then I should see user found
    
  @javascript
    Scenario: add friend
    Given I am a logged in user
    When I go to My Friends page
    And I search for friend by first name
    And I add user as a friend
    Then I should see user in My Friends list
    
  @javascript
    Scenario: add friend
    Given I am a logged in user
    When I go to My Friends page
    And I remove user from friends
    Then I should not see user in My Friends list    