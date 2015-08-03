Feature: Play a game

  Scenario: Play game with correct moves
    Given I am on the index page
    When I play a game with correct moves
    Then I should see the main game page with next move

  Scenario: Play game with wrong moves
    Given I am on the index page
    When I try to access wrong cell
    Then I should see the last correct game page

  Scenario: PlayerOne wins the game with last column combination
    Given I am on the index page
    When PlayerOne wins with last column combination
    Then I should see the game over page with "PlayerOne" wins

  Scenario: PlayerTwo wins the game with middle row combination
    Given I am on the index page
    When PlayerTwo wins with middle row combination
    Then I should see the game over page with "PlayerTwo" wins

  Scenario: The game ends with a draw
    Given I am on the index page
    When The game ends with a draw
    Then I should see the game over page with draw message