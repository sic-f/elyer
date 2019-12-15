Feature: Operations on a place when not authorized
  As an administrator
  In order to not allow users to perform operations on places they did not create
  I want to apply authorization to prohibit certain operations on a place

  Background:
    Given there is a place I have not created and I am signed in

  Scenario: Edit link on place card in the index page does not render
    When I am on the home page
    Then I should not see the "EDIT" link on a place card

  Scenario: Edit link on place card in the show page does not render
    When I go to the place show page
    Then I should not see the "EDIT" link on a place card

  Scenario: Trash can link on place card in the show page does not render
    When I go to the place show page
    Then I should not see the trash can link on a place card
