Feature: Permissions on adding captions
  As owner of the site
  In order to restrict unauthorized adding of comments
  I want to hide the edit link when an unauthenticated user is on the photo page

  Background:
    Given place "Expo CenterNet de Argentina" with a photo

  Scenario: Edit link not visible when not logged in
    Given visitor is on the photo page
    Then visitor should not see the Edit link

  Scenario: User is logged in but not her photo
    Given user "Chiquita Verano" is signed in
    When user is on the photo page that is not hers
    Then user "Chiquita Verano" should not see the Edit link

