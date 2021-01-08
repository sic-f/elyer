Feature: Comments on places
  As a user
  So that I can provide more info or ask questions about a place
  I want to be able to post comments on pictures

  Background:
    Given user "Rolande Tejada" is signed in
    And place "World Trade Center Sevilla" exists with a photo
    Given user is on the image page

  Scenario: Post comment on a picture
    When user posts a comment "Where is this?" on the picture
    Then user will see that comment below the picture

  Scenario: Edit comments
    And image has a comment "On the way to the beach."
    When user replaces comment "On the way to the beach." with "View of the sunset."
    Then user will see updated comment "View of the sunset."


