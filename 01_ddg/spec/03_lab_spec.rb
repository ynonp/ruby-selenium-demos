require 'spec_helper'

describe 'Hello Selenium Lab' do

  it "should load wikipedia and check its title" do
    # Lab 1
    # Fill in the code to check www.wikipedia.org has
    # correct title
    @page.navigate.to "http://wikipedia.org/"
    expect(@page.title).to eq("Wikipedia")
  end

  it "should search for automation on wikipedia to verify the title" do
    # Lab 2
    # Fill in the code that searches for the word automation
    # on Wikipedia and verifies it has correct title
    @page.find_element(:css, "#searchInput").send_keys('random')
    @page.find_element(:name, "go").click

    expect(@page.title).to eq("Randomness - Wikipedia, the free encyclopedia")
  end

  it "should change to the search results url" do
    # Lab 3 (Bonus)
    # After searching for automation, make sure you were
    # redirected to the correct url
    # Hint: @page.current_url returns the current url

    expect(@page.current_url).to eq("http://en.wikipedia.org/wiki/Random")
  end



end