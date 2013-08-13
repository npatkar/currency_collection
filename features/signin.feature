Feature: Login
  In order to enhance security
  as an admin Mr.Smart
  wants to check login credentials of the user.


Scenario: Password cannot be blank
    Given I am on a signin page
    When I sign in with a blank password
    And I press "Sign in" 
    Then I should be on "signin"
    Then I should see "Invalid email or password."    

Scenario: Email cannot be blank
    Given I am on a signin page
    When I sign in with a blank email
    Then I should be on "signin"
    Then I should see "Invalid email or password."    
    
Scenario: Invalid email
    Given I exist as a user
    Given I am on a signin page
    When I sign in with a wrong email 
    Then I should be on "signin"
    Then I should see "Invalid email or password."    
   
Scenario: Invalid Password
    Given I exist as a user
    Given I am on a signin page
    When I sign in with a wrong password
    Then I should be on "signin"
    Then I should see "Invalid email or password."    

Scenario: Valid Username and password test
    Given I exist as a user
    Given I am on a signin page
    When I sign in with valid credentials
    Then I should be on "the home page"
    Then I see a successful sign in message
