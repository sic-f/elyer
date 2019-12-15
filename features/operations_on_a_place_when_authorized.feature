Feature: Operations on a place when authorized
  As an administrator
  In order to properly allow users to perform operations only on places they have created
  I want to apply authorization on certain operations on a place

  Background:
    Given I have submitted a place and I am signed in

  Scenario: Edit link on place card in the index page renders
    When I am on the home page
    Then I should see the "EDIT" link on a place card

  Scenario: Edit link on place card in the show page renders
    When I go to the place show page
    Then I should see the "EDIT" link on a place card

  Scenario: Trash can link on place card in the show page renders
    When I go to the place show page
    Then I should see the trash can link on a place card
