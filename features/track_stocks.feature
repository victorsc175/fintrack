Feature: Users can track stocks, upto 10 per user. The profile page will display all the current stock prices

  In order to track stocks
  As a logged in user
  I need to have ability to manage up to 10 stocks and profile page will display all the current stock prices
  
    Scenario: view My Portfolio page
      Given I am a logged in user
      When I go to My Portfolio page
      Then I can see Search for Stocks form

  @javascript 
    Scenario: manage up to 10 stocks
      Given I am a logged in user
      When I go to My Portfolio page
      Then I should have ability to add 10 stocks to my portfolio