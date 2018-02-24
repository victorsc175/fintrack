Feature: Users can search for stock symbols using a search bar

  In order to search stocks
  As a logged in user
  I need to have ability to search stocks by tickers
      
  @javascript  
    Scenario: Look up a stock
      Given I am a logged in user
      When I go to My Portfolio page
      And I search for some stock by ticker
      Then I should see ticker details
