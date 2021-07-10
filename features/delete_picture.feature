Feature: Delete picture
  As a user
  In order to take down pictures I don't want anymore
  I want to be able to delete pictures of a place

  Background:
    Given user "Vertie Tugonon" is signed in and is on the home page and has submitted a place called "Feria de Zaragoza" with an image

  @javascript
  Scenario: Successfuly delete picture
    And user is viewing an image
    When user clicks on the delete "trash can" button
    Then user should be redirected to the place page with successful delete message

