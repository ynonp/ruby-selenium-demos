require 'rspec'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.before(:all) do
    # Run the test on the attached Android device
    # Be sure to start Selendroid
    @page = Selenium::WebDriver.for :remote,
                                    :desired_capabilities => :android
  end

  config.after(:all) do
    # @page.quit
  end
end

