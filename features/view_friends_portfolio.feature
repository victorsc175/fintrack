Feature: Users can view portfolio of stocks their friends are tracking for investing ideas

  In order to track investing ideas of friends
  As a logged in user
  I need to have ability to view friends portfolio
  
  @javascript
    Scenario: view friend's portfolio
    Given I am a logged in user
    When I go to My Friends page
    And I view friend's profile
    Then I should see friend's stocks portfolio