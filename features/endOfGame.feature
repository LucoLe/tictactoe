Feature: Play a game

  Scenario: PlayerOne wins the game and wants to play again with the same opponent
    Given I am on the index page
    When PlayerOne wins with last column combination
    And Play again is clicked
    Then I should see the main game page with empty board and players' names switched

  Scenario: The game ends with a draw and the opponents play again
    Given I am on the index page
    When The game ends with a draw
    And Play again is clicked
    Then I should see the main game page with empty board and players' names switched

  Scenario: PlayerOne wins the game and wants a new game with different opponent
    Given I am on the index page
    When PlayerOne wins with last column combination
    And New game is clicked
    Then I should see the index page