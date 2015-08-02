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

When(/^I try to access wrong "([^"]*)"$/) do |arg1|
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