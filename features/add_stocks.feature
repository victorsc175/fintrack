Feature: Users can choose to add a stock from results of search to their portfolio

  In order to track stocks
  As a logged in user
  I need to have ability to add a stock from results of search to their portfolio
      
  @javascript  
    Scenario: Add a stock
      Given I am a logged in user
      When I go to My Portfolio page
      And I search for some stock by ticker
      And I add the stock
      Then I should have the stock added to the stock list
      
  @javascript  
    Scenario: Remove stock
      Given I am a logged in user
      When I go to My Portfolio page
      And I search for some stock by ticker
      And I add the stock
      And I delete the stock
      Then I should have the stock removed from the stock list