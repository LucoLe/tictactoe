Feature: Create players

  Scenario: Create players successfully
    Given I am on the index page
    When I submit players with correct credentials
    Then I should see the main game page with players names on top

  Scenario: Try to submit no players' names
    Given I am on the index page
    When I submit no name
    Then I should see the index page with "warning"

  Scenario: Try to submit only one name
    Given I am on the index page
    When I submit only one name
    Then I should see the index page with "warning"