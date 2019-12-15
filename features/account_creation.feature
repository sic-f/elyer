Feature: Account Creation
  As a visitor
  In order to start using the site
  I want to create an account

  Scenario: Visit account creation page
    Given I am on the home page
    And I click on "Sign up" link
    Then I should be on the sign up page

  Scenario: Successful account creation
    Given I am on the sign up page
    When I fill in the required fields
    And I click on "Create Account" button
    Then I should be redirected to the home page and see the welcome flash message

  Scenario: Unsuccessful account creation with no email
    Given I am on the sign up page
    When I fill in the required fields except email
    And I click on "Create Account" button
    Then I should see an error message indicating an invalid email
    And I should still be in the sign up page

  Scenario: Unsuccessful account creation with no first name 
    Given I am on the sign up page
    When I fill in the required fields except first name
    And I click on "Create Account" button
    Then I should see an error message indicating a blank first name
    And I should still be in the sign up page

  Scenario: Unsuccessful account creation with no last name 
    Given I am on the sign up page
    When I fill in the required fields except last name
    And I click on "Create Account" button
    Then I should see an error message indicating a blank last name
    And I should still be in the sign up page

  Scenario: Unsuccessful account creation with no password 
    Given I am on the sign up page
    When I fill in the required fields except password
    And I click on "Create Account" button
    Then I should see an error message indicating a blank password
    And I should still be in the sign up page
