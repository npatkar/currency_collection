Feature: Manage Countries
  In order to manage his travel itinerary
  Mr. Smart
  wants to manage the Countries he has travelled.

  Scenario:Countries List
    Given the country page
    Given I am logged in 
    When I follow "Countries"    
    Then I should see the  table:
      |Name|Code|Status|Show|Edit|Update|
      |India|IND|Not Visited|Show|Edit||
     
  
  Scenario:Countries Visit Test
    Given the country page
    Given I am logged in 
    When I follow "Countries"    
    When I follow "Edit"    
    When I check "visit_id"   
    And I press "Update Country" 
    When I follow "Back" 
    Then I should see the  table:
      |Name|Code|Status|Show|Edit|Update|
      |India|IND|Visited|Show|Edit||
    When I follow "Currencies"            
    Then I should see the following table:
      |Name|Code|Status|Show|Update|
      |Rupaya|R|Collected|Show||    
 


