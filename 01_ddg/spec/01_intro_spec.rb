require 'spec_helper'

describe "Smoke test" do

  it "should load ddg home page" do
    @page.navigate.to 'http://www.duckduckgo.com'
    expect(@page.title).to eq('DuckDuckGo')
  end

end



