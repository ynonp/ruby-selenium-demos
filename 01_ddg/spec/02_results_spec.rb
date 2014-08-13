require 'spec_helper'

describe "Search Results" do
  # We can run some code before all tests happen
  # so for the below scenario we'll perform a new search
  before :all do
    @page.navigate.to 'http://www.duckduckgo.com'
    @page.find_element(:name, 'q').send_keys('test automation')
    @page.find_element(:name, 'q').submit
  end

  # And now we can test the results
  it "should have correct title" do
    expect(@page.title).to eq('test automation at DuckDuckGo')
  end

  # find_elements is used to find multiple elements
  # the result is a list of elements, so we can ask about its size
  it "should have at least two items in the top menu" do
    sponsored_items = @page.find_elements(:css, '.zcm__link')
    expect(sponsored_items.size).to be >= 2
  end

end


