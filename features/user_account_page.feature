Feature: User account page
  As a user
  I want to access my account details
  So that I can update my personal details

  Background:
    Given a user "Janita Magpantayg" is signed in
    And user is on the home page

  Scenario: Account link on home page
    When user clicks on "Account" link
    Then user "Janita Magpantayg" should be redirected to the account page

  Scenario: Profile link on home page
    When user clicks on "Profile" link
    Then user "Janita Magpantayg" should be redirected to the account page

