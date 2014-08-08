require 'spec_helper'

describe "Upvoting" do

  it "should not allow guest to upvote" do
    @page.navigate.to 'http://www.reddit.com'
    el = @page.find_element(:css, "#siteTable > div.thing.id-t3_1yyc2g.odd.link > div.midcol.unvoted > div.arrow.up.login-required")

    popup = @page.find_element(:css, ".popup")
    expect(popup.displayed?).to be_false

    el.click
    expect(popup.displayed?).to be_true

  end

  it "should allow users to upvote" do
    username = "ynonp"
    password = "o3S8Uea5"

    @page.navigate.to 'http://www.reddit.com'

    @page.find_element(:name, "user").send_keys(username)
    @page.find_element(:name, "passwd").send_keys(password)
    @page.find_element(:css, ".submit .btn").click


    @page.navigate.to 'http://www.reddit.com'
  end

end



