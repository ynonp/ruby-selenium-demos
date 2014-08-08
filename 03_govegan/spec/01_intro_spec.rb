require 'spec_helper'

####################
# Mobile Testing
#

describe "Language Selection" do
  before :all do
    @page.navigate.to 'http://www.go-vegan.co.il/'
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  end

  it "should display a language selection dialog" do
    picker = @page.find_element(:css, '#picker')
    expect(picker.displayed?).to be_true
  end
  #
  #it "should select the correct language when picking hebrew" do
  #  picker = @page.find_element(:css, '#picker')
  #  hebrew = picker.find_element(:css, '#pick1')
  #
  #  expect(hebrew.text).to eq('עברית')
  #
  #  hebrew.click
  #
  #  @wait.until { @page.find_element(:css, 'body.lang-he') }
  #
  #  body = @page.find_elements(:css, 'body.lang-he')
  #  expect(body.size).to eq(1)
  #end

end

