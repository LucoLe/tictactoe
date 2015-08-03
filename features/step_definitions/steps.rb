Given(/^I am on the index page$/) do
  visit('http://localhost:4567/')
end

When(/^I submit players with correct credentials$/) do
  fill_in 'player1', with: 'PlayerOne'
  fill_in 'player2', with: 'PlayerTwo'
  click_on 'Play'
end

Then(/^I should see the main game page with players names on top$/) do
  expect(page).to have_text 'PlayerOne'
  expect(page).to have_text 'PlayerTwo'
end

When(/^I submit no name$/) do
  click_on 'Play'
end

Then(/^I should see the index page with warning "([^"]*)"$/) do |arg1|
  expect(page).to have_text arg1
end

When(/^I submit only one name$/) do
  fill_in 'player1', with: 'PlayerOne'
  click_on 'Play'
end

When(/^I play a game with correct moves$/) do
  fill_in 'player1', with: 'PlayerOne'
  fill_in 'player2', with: 'PlayerTwo'
  click_on 'Play'
  click_link 'cell1'
  click_link 'cell2'
  click_link 'cell3'
  click_link 'cell4'
  click_link 'cell5'
end

Then(/^I should see the main game page with next move$/) do
  css_class = "X"
  expect(page.all('span').size).to eq(5)
  page.all('span') do |span|
    expect(span).to have_css(css_class)
    css_class = css_class == "X" ? "glyphicon" : "X"
  end
end

When(/^I try to access wrong cell$/) do
  fill_in 'player1', with: 'PlayerOne'
  fill_in 'player2', with: 'PlayerTwo'
  click_on 'Play'
  click_link 'cell1'
  click_link 'cell2'
  click_link 'cell3'
  visit('http://localhost:4567/game/asdf')
  visit('http://localhost:4567/game/1')
  visit('http://localhost:4567/game/15')
end

Then(/^I should see the last correct game page$/) do
  css_class = "X"
  expect(page.all('span').size).to eq(3)
  page.all('span') do |span|
    expect(span).to have_css("span.#{css_class}")
    css_class = css_class == "X" ? "glyphicon" : "X"
  end
end

When(/^PlayerOne wins with last column combination$/) do
  fill_in 'player1', with: 'PlayerOne'
  fill_in 'player2', with: 'PlayerTwo'
  click_on 'Play'
  click_link 'cell3'
  click_link 'cell1'
  click_link 'cell6'
  click_link 'cell7'
  click_link 'cell9'
end

# Then(/^I should see the game over page with PlayerOne wins$/) do
#   expect(page).to have_text "Congratulations PlayerOne wins!"
# end

When(/^PlayerTwo wins with middle row combination$/) do
  fill_in 'player1', with: 'PlayerOne'
  fill_in 'player2', with: 'PlayerTwo'
  click_on 'Play'
  click_link 'cell1'
  click_link 'cell4'
  click_link 'cell3'
  click_link 'cell5'
  click_link 'cell7'
  click_link 'cell6'
end

Then(/^I should see the game over page with "([^"]*)" wins$/) do |arg1|
  expect(page).to have_text "Congratulations #{arg1} wins!"
end

When(/^The game ends with a draw$/) do
  fill_in 'player1', with: 'PlayerOne'
  fill_in 'player2', with: 'PlayerTwo'
  click_on 'Play'
  click_link 'cell1'
  click_link 'cell2'
  click_link 'cell3'
  click_link 'cell5'
  click_link 'cell4'
  click_link 'cell6'
  click_link 'cell8'
  click_link 'cell7'
  click_link 'cell9'
end

Then(/^I should see the game over page with draw message$/) do
  expect(page).to have_text "The game was a draw!"
end

When(/^Play again is clicked$/) do
  click_on 'Play again'
end

Then(/^I should see the main game page with empty board and players' names switched$/) do
  expect(URI.parse(current_url).path).to eq('/game')
  expect(page.all('div.empty').size).to eq(9)
  expect(page).to have_text "PlayerTwo: X vs PlayerOne: O"
end

When(/^New game is clicked$/) do
  click_on 'New game'
end

Then(/^I should see the index page$/) do
  expect(URI.parse(current_url).path).to eq('/')
end