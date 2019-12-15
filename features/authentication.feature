Feature: Authentication
  As a user
  In order to be able to use the site's features
  I want to login

  Scenario: Visit login page
    Given I am on the home page
    When I click on "Sign in" link
    Then I should be on the sign in page

  Scenario: Successful login
    Given I am on the sign in page
    When I fill in the required fields to log in
    And I click on "Sign in" button
    Then I should be on the home page with signed in state

  Scenario: Unsuccessful login with wrong password
    Given I am on the sign in page
    When I fill in the required fields to log in with wrong password
    And I click on "Sign in" button
    Then I should still be on the sign in page

  Scenario: Unsuccessful login with blank email and password
    Given I am on the sign in page
    When I leave the log in fields blank
    And I click on "Sign in" button
    Then I should still be on the sign in page

  Scenario: Logout
    Given I am signed in
    When I click on "Sign out" link
    Then I should be redirected to the log in page

  Scenario: "Account" and "Your Contributions" links not visible when not signed in
    When I am on the home page and not signed in
    Then The "Account" and "Your Contributions" links are not visible

  Scenario: "Profile" and "Your Contributions" sidebar links not visible when not signed in
    When I am on the home page and not signed in
    Then The "Profile" and "Your Contributions" links are not visible

