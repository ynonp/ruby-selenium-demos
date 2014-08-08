require 'rspec'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.before(:all) do
    @page = Selenium::WebDriver.for :remote, :desired_capabilities => :android
  end

  config.after(:all) do
    @page.quit
  end
end

