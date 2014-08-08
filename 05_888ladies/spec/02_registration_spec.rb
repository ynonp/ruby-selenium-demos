require 'spec_helper'
require 'pry'

def input_value(page, css)
  page.execute_script("return document.querySelector('#{css}').value");
end

describe "Registration Screen" do
  before :all do
    @page.navigate.to 'http://m.888ladies.bingosys.net/client/index.aspx?#/registration'
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  end

  it "should start at step 1" do
    @wait.until { @page.find_elements(:css, '.step1').size > 0 }
    expect(@page.find_elements(:css, '.step1.active').size).to be > 0
  end

  it "should show an error if user left first name field empty" do
    next_btn = @page.find_element(:css, '#regsitrationFooter a')
    next_btn.click

    expect(@page.find_element(:css, '#userFirstNameerror').displayed?).to be_true
  end

  it "should show an error if user left last name field empty" do
    firstname_input = @page.find_element(:css, '#userFirstNameinput')
    next_btn = @page.find_element(:css, '#regsitrationFooter a')
    firstname_input.send_keys('john')
    next_btn.click

    expect(@page.find_element(:css, '#userFirstNameerror').displayed?).to be_false
    expect(@page.find_element(:css, '#userLastNameerror').displayed?).to be_true
  end

  it "should proceed to next step if all values are ok" do
    lastname_input = @page.find_element(:css, '#userLastNameinput')
    lastname_input.send_keys('doe')

    next_btn = @page.find_element(:css, '#regsitrationFooter a')
    next_btn.click
    @wait.until { @page.find_elements(:css, '.step2.active').size > 0 }
  end

  it "should remember user details when going back to step 1" do
    back_btn = @page.find_element(:css, '.backBTN a')
    back_btn.click
    @wait.until { @page.find_elements(:css, '.step1.active').size > 0 }

    expect(input_value(@page, '#userFirstNameinput')).to eq('john')
    expect(input_value(@page, '#userLastNameinput')).to eq('doe')
  end
end

