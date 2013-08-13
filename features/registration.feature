Feature: Registration
  In order to enhance security
  as an admin Mr.Smart
  wants to check registration process.

Scenario: Registaration email blank
   Given I am on the signup page
   When I sign up with a blank email
   Then I should be on "sign up fail" page
   Then I should see "Email can't be blank"    

Scenario: Registaration password blank
   Given I am on the signup page
   When I sign up without a password
   Then I should be on "sign up fail" page
   Then I should see "Password can't be blank"    

Scenario: Registaration password Invalid
   Given I am on the signup page
   When I sign up with invalid password
   Then I should be on "sign up fail" page
   Then I should see "Password is too short (minimum is 8 characters)" 

Scenario: Registaration password confirmation does not match
   Given I am on the signup page
   When I sign up with a mismatched password confirmation
   Then I should be on "sign up fail" page
   Then I should see "Password doesn't match confirmation"    

Scenario: Already registered email address
   Given I exist as a user
   Given I am on the signup page
   When I fill in "user_email" with "npatkar@gmail.com"
   And I fill in "user_password" with "aaaaaaaa"
   And I fill in "user_password_confirmation" with "aaaaaaaa"
   And I press "Sign up"
   Then I should be on "sign up fail" page
   Then I should see "Email has already been taken"    

Scenario: Successful registration.
   Given I am on the signup page
   When I sign up with valid user data
   Then I should be on "the home page"
   And I see a successful sign in message
