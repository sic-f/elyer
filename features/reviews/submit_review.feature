Feature: Submit review
  As a user
  In order to place a review of a place
  I want to submit a review

  Scenario: Successful review submission
    Given a place called "Caldereta Espesyal"
    Given user "Francis Pineda" is logged in
    When user submits a review with content "Best caldereta in town!" for that place
    Then user sees "Successfully submitted review."
    And user sees "Best caldereta in town!"
    And user sees "Francis Pineda"
    And user sees "Reviewed on"

  Scenario: Unauthenticated user
    Given a place called "Caldereta Espesyal"
    When user goes to the page of "Caldereta Espesyal"
    And tries to write a review
    Then user is redirected to the log in page
