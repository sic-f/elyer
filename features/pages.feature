Feature: Pages
  As a visitor/user
  In order to use the site properly
  I want to be able to see the main pages of the site with complete elements

  Scenario: Navigation bar
    Given I am on the home page
    Then I should see the navigation bar

  Scenario: Index page has no places posted
    Given I am on the home page
    Then I should see no places posted yet

  Scenario: Index page has places posted
    Given I am on the home page and places were already submitted
    Then I should see places posted
