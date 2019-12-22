Feature: User update
  As a user
  I want to update my details
  So I can have a record of up to date details of my account

  Background:
    Given user "Barb Inserto" is signed in and is on the home page
    When user clicks on "Account" link
    And user clicks on "Edit" link

  Scenario: Successfuly update account details
    When user fills in required fields to update user details with "Barb", "Inserto", "cordia@example.net", "qFIXVjGmYh1"
    And user clicks on "Update" button
    Then user should be redirected to user show page with heading "Barb Inserto" and success message

  Scenario: Blank fields
    When user leaves required fields blank for updating an account
    And user clicks on "Update" button
    Then user "Barb Inserto" receives error messages and should still be on the edit account page


