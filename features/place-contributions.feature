Feature: Get a list of places submitted by each user
  As a user
  I want to see all the places I have submitted
  So that I can manage all of them

  Scenario: Visit user contributions page
    Given I am signed in
    And I am on the home page
    When I click on Your Contributions link
    Then I will be redirected to the index page of places created by a user
