# Assignment

In this sample app I have developed a fully functioning version of [T​icTacToe](https://en.wikipedia.org/wiki/Tic-tac-toe)

* It is a 2­ player game (no computer opponent), paying in the same browser window.
* Before each match the players are asked for their names.
* Players switch after every turn.
* Once a round is finished, the winner (or draw) will be displayed on a leaderboard.

# Comments

I have used git for version control and a combination of Capybara, Cucumber and RSpec to develop the application in BDD manor. I have configured Capybara to use drivers for Chrome and Mozilla for in browser testing, and rack_test for simulated browser testing.
I have used Twitter Bootstrap and JQuery to create the frontend of the application. And YARD to create the documentation of the code.

# To start the application

In the project folder run the following commands:

  - bundle install
  - ruby app.rb

After that the application can be tested on http://localhost:4567/

# TODO

1. I should add database to store the players results and update the leaderboard to show where in the rank list is the winner of the game.

2. The number of wins should be stored and displayed in the  for every player.

3. The game board should be stored in a hash with number keys or the array should be with 10 elements and ignore the 0-th element.
