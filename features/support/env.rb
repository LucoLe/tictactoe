require 'bundler/setup'
require 'capybara/cucumber'
require 'rspec/expectations'
require_relative '../../app'

ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
# Capybara.default_driver = :selenium
Capybara.default_driver = :rack_test

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.app = TicTacToe