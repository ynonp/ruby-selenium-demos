require 'spec_helper'
#
# The test below fails because it checks
# the title too soon.
# Use wait to fix it
describe "Google Wait for results" do
  it "should change title in search results" do
    @page.navigate.to 'http://www.google.com'
    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

    search_box = @page.find_element(:name, 'q')
    search_box.send_keys('automation')
    expect(@page.title).to eq('Google')

    search_box.submit

    expect(@page.title).to_not eq('Google')
  end
end

# Using a regular browser, navigate to
# http://docs.angularjs.org/api/ng.directive:input.checkbox
# You'll find breadcrumbs at the top, which lead to the index page.
#
# In this test we try to verify they work.
#
# Currently test fails because it checks the next page title
# before page is actually displayed.
# Use wait to fix it
describe "Angular Docs Changing Pages" do
  it "should go back to index page when clicking on the index link" do
    @page.navigate.to 'http://docs.angularjs.org/api/ng.directive:input.checkbox'
    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

    index_link = @page.find_element(:css, 'ul.breadcrumb li:first-child  a')
    index_link.click

    title = @page.find_element(:css, '#angularjs-api-docs')
    expect(title.text).to eq('AngularJS API Docs')
  end
end
