Feature: Play a game

  Scenario: Play game with correct moves
    Given I am on the index page
    When I play a game with correct moves
    Then I should see the main game page with next move

  Scenario: Play game with wrong moves
    Given I am on the index page
    When I try to access wrong "cell"
    Then I should see the last correct game page