require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "steak"
require "capybara/rails"
require "capybara/dsl"
require "selenium-webdriver"

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

Capybara.default_wait_time = 10
Capybara.server_port = 3333

RSpec.configure do |config|

  config.include Warden::Test::Helpers
  config.include Capybara, :type => :acceptance

  config.before(:each) do
    Rails.cache.clear
  end

  config.before(:each, :js => true) do
    Capybara.current_driver = :selenium
  end

  config.after(:each, :type => :acceptance) do
    case page.driver.class
    when Capybara::Driver::RackTest
      page.driver.rack_mock_session.clear_cookies
    when Capybara::Driver::Culerity
      page.driver.browser.clear_cookies
    when Capybara::Driver::Selenium
      page.driver.cleanup!
    end
    Capybara.use_default_driver
  end

end
