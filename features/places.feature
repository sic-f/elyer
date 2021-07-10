Feature: Places
  As a user
  In order to contribute to the site
  I want to be able to perform operations on places

  Scenario: Navigate to place submission page
    Given I am signed in
    And I click on "Add" link
    Then I should be on the place submission page

  Scenario: Unaccessible place submission page if not signed in
    Given I am on the home page
    Then I should not see the "Add" link to submit a place

  Scenario: Successfully submit a place
    Given I am signed in
    And I click on "Add" link
    When I fill in the required fields to submit a place
    And I click on "Submit" button
    Then I should be on the place page

  Scenario: Submit place with blank website and social media sites
    Given I am signed in
    And I click on "Add" link
    When I fill in the required fields with blank website and social media sites
    And I click on "Submit" button
    Then I should see blank website and social media sites

  Scenario: Submit a place with invalid fields
    Given I am signed in
    And I click on "Add" link
    When I fill in the required fields with blank values
    And I click on "Submit" button
    Then I should still be on the page submission page with error messages

  Scenario: Update a place with valid fields
    Given I am signed in and I try to edit a place that has been submitted
    When I fill in the name field for that place
    And I click on "Submit" button
    Then I should be on the place page with an update success message

  Scenario: Update a place with invalid fields
    Given I am signed in and I try to edit a place that has been submitted
    When I leave the name and address fields blank for that place
    And I click on "Submit" button
    Then I should still be on the place edit page with error messages for name and address

  @javascript
  Scenario: Deleting a place
    Given I am signed in and I go to a place's page
    When I click on the delete "trash can" button
    Then I should be redirected to the home page with a successful delete message

  @javascript
  Scenario: Delete a place with reviews
    Given I am signed in and I go to a place's page with reviews
    When I click on the delete "trash can" button
    Then I should be redirected to the home page with a successful delete message

