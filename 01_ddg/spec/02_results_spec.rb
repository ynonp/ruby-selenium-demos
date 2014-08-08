require 'spec_helper'

describe "Search Results" do
  before :all do
    @page.navigate.to 'http://www.duckduckgo.com'
    @page.find_element(:name, 'q').send_keys('test automation')
    @page.find_element(:name, 'q').submit
  end

  it "should have correct title" do
    expect(@page.title).to eq('test automation at DuckDuckGo')
  end

  it "should have at least one sponsored item" do
    expect(@page.find_elements(:css, '.sponsored_info').size).to be > 0
  end

end


