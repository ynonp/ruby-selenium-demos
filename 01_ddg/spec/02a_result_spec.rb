require 'spec_helper'

describe "Top Menu" do

  it "should have Sport" do
    @page.navigate.to "http://www.888games.com/"
    @page.navigate.to "http://www.888games.com/"

    el = @page.find_element(:css, ".UpperMenuRepeaterLinkSport")
    expect(el.text).to eq("Sport")

    text = el.attribute('href')
    expect(text.start_with?("http://www.888sport.com/")).to be_true
  end

  it "should have Poker" do
    el = @page.find_element(:css, ".UpperMenuRepeaterLinkPoker")
    expect(el.text).to eq("Poker")
  end

  it "should have Casino" do
    el = @page.find_element(:css, ".UpperMenuRepeaterLinkCasino")
    expect(el.text).to eq("Casino")
  end

  it "should have all 6 links by order" do
    items = @page.find_elements(:css, "#UpperMenu a")

    expect(items[0].text).to eq('Casino')
    expect(items[1].text).to eq('Poker')
    expect(items[2].text).to eq('Sport')
    expect(items[3].text).to eq('Bingo')
    expect(items[4].text).to eq('Games')
    expect(items[5].text).to eq('VIP')

    expect(items.size).to eq(6)
  end

end



