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