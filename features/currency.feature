Feature: Manage Currencies
  In order to manage his travel itinerary
  Mr. Smart
  wants to manage the currencies he has collected.

  Scenario:Currencies List
    Given the currency page
    Given I am logged in 
    Then I should see "Signed in as npatkar@gmail.com"    
    Then I should see the following table:
      |Name|Code|Status|Show|Update|
      |Rupaya|R|Not Collected|Show||
     




