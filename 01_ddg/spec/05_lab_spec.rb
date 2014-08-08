require 'spec_helper'

describe 'Mozilla Start Page - Top Menu' do

  it 'should have 6 items' do
    # Lab 1
    # The CSS selector: #nav-main > ul > li
    # returns all li elements that are part of the top menu.
    #
    # Verify the top menu shows 6 items
    #
    @page.navigate.to('http://www.mozilla.org/en-US/firefox/central/')
    # Replace the ... with the code to capture all top menu items
    #top_menu_items = @page.find_elements(...)

    #expect(top_menu_items.count).to eq(6)
  end

  it 'should have the correct items and order' do
    # Lab 2
    # The CSS selector: #nav-main > ul > li > a
    # returns all <a> items that describe top menu entries.
    # Use the .text method of each item to make sure your top menu
    # shows: Desktop, Mobile, Releases, Add-Ons, Support, About

    @page.navigate.to('http://www.mozilla.org/en-US/firefox/central/')
    top_menu_items = @page.find_elements(:css, '#nav-main > ul > li > a')
    expect(top_menu_items[0].text).to eq('DESKTOP')

    # Fill in all other tests to make sure other menu items are as expected
  end

  it 'should display form details after it was clicked' do
    # Lab 3
    # The newsletter registration form at the bottom is only displayed
    # after a user clicked in the input box
    #
    # Given the input box and details elements, fix the test so it
    # passes and tests the form is displayed only after clicking the input box

    details = @page.find_element(:id, 'form-details')
    input_box = @page.find_element(:id, 'id_email')

    expect(details.displayed?).to be_false

    # Add line here to display the form details

    expect(details.displayed?).to be_true
  end

  it 'should show top details if Mozilla is clicked' do
    # Lab 4 - Bonus
    #
    # When clicking on the Mozilla top menu item, a new top menu is
    # displayed to the user
    # Write a full test to verify this behavior

  end

end