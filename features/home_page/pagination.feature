Feature: Pagination of places on the home page
  As a user
  In order to lessen the load time on the home page
  I want to see paginated places on the home page

  Background:
    Given six places
    When user is on the home page

  Scenario: Five places on the home page
    Then user should not see "Palau de Congressos de Catalunya"
    Then user sees "Business Planet"
    Then user sees "Los Almendros de Huechuraba"
    Then user sees "Can Domenge. Centre Tecnologic"
    Then user sees "Feria de Muestras de Navarra, S.L."
    Then user sees "Centro de Exposiciones y Convenciones de Chihuahua"

  Scenario: Second page
    When user clicks on page 2
    Then user sees "Palau de Congressos de Catalunya"
    Then user should not see "Business Planet"
    Then user should not see "Los Almendros de Huechuraba"
    Then user should not see "Can Domenge. Centre Tecnologic"
    Then user should not see "Feria de Muestras de Navarra, S.L."
    Then user should not see "Centro de Exposiciones y Convenciones de Chihuahua"
