Feature: Comments on places
  As a user
  So that I can provide more info or ask questions about a place
  I want to be able to post comments on pictures

  Background:
    Given user "Rolande Tejada" is signed in
    And place "World Trade Center Sevilla" exists with a photo

  Scenario: Post comment on a picture
    Given user is on the image page
    When user posts a comment "Where is this?" on the picture
    Then user will see that comment below the picture
