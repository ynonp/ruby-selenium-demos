require 'rspec'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.before(:all) do
    @page = Selenium::WebDriver.for :firefox

    caps = Selenium::WebDriver::Remote::Capabilities.firefox
    caps.version = "5"
    caps.platform = :XP
    caps[:name] = "Testing Selenium 2 with Ruby on Sauce"

    @page = Selenium::WebDriver.for(
        :remote,
        :url => "http://ynonp:189a9afd-62c4-4833-9d2e-9b1c5ae6beb6@ondemand.saucelabs.com:80/wd/hub",
        :desired_capabilities => caps)




  end

  config.after(:all) do
    @page.quit
  end
end

