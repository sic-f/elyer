Feature: Image caption
  As a contributor
  I want to be able to add captions on pictures that I upload
  So that people understand what the picture is about and also serve as a guide to point to the particular place being described

  Background:
    Given user "Vertie Tugonon" is signed in and is on the home page and has submitted a place called "Feria de Zaragoza" with an image

  Scenario: Add a caption to an image
    And user is viewing an image
    When user enters description "On the way to the home stay" for that image
    Then user should see "On the way to the home stay" below the image
