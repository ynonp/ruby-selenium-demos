require 'spec_helper'

describe "Guest Home Page" do
  before :all do
    @page.navigate.to 'http://www.reddit.com/'
  end

  it "should have 25 stories" do
    things = @page.find_elements(:css, '.sitetable .thing')
    expect(things.size).to eq(25)
  end

  it "should order items" do
    things = @page.find_elements(:css, '.sitetable .thing')

    for i in 0..things.size-2 do
      rank_curr = things[i].find_element(:css, '.rank').text.to_i
      rank_next = things[i+1].find_element(:css, '.rank').text.to_i

      expect(rank_curr).to be < rank_next
    end
  end

  # A subreddit is an internal reddit page (like a section)
  # Each story is posted to a subreddit, and links back there
  #
  # Verify all stories subreddit links point to the right place
  #

  it "should lead to the right subreddit" do
    things = @page.find_elements(:css, '.sitetable .thing')

    things.each do |item|
      subreddit_link = item.find_element(:css, '.subreddit')
      href = subreddit_link.attribute('href')

      expect(href).to eq("http://www.reddit.com/r/#{subreddit_link.text}/")
    end
  end

  it "should change top thing after clicking next" do
    all_items = @page.find_elements(:css, '#siteTable_organic .thing')
    next_btn = @page.find_element(:css, 'button.arrow.next')

    current_index = all_items.find_index { |item| item.displayed? }
    expect(current_index).not_to be_nil

    next_btn.click
    next_index = all_items.find_index { |item| item.displayed? }
    expect(current_index).not_to eq(next_index)

  end
end

