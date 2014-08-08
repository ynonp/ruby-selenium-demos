require 'spec_helper'

###
# Credentials:
# user: jane1232
# password: abab1a1a

describe "Login Page" do
  before :all do
    @page.navigate.to 'http://m.888ladies.bingosys.net/client/index.aspx'
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  end

  it "should display a popup recommending to use chrome" do
    @wait.until { @page.find_elements(:css, '.generalPopUp').size > 0 }

    popup = @page.find_element(:css, '.generalPopUp')
    popup_text = popup.find_element(:css, 'p').text

    expect(popup_text).to eq('For the best experience we strongly recommend using Google Chrome browser. You may download it from Google Play Store for free.')

    close_btn = @page.find_element(:css, '#popupCloseButton')
    close_btn.click

    expect(@page.find_elements(:css, '.generalPopUp').size).to eq(0)
  end
  #
  #it "should display invalid user or password error for invalid user" do
  #  input_username = @page.find_element(:css, '#inputUsername')
  #  login_btn      = @page.find_element(:css, '#buttonLogin')
  #
  #  input_username.send_keys('joe')
  #  login_btn.click
  #
  #  @wait.until { @page.find_elements(:css, '.generalPopUp').size > 0 }
  #
  #  popup_text = @page.find_element(:css, '.generalPopUp p').text
  #  expect(popup_text).to eq('Bad username or password')
  #
  #  close_btn = @page.find_element(:css, '.generalPopUp #popupCloseButton')
  #  close_btn.click
  #
  #  @wait.until { @page.find_elements(:css, '.generalPopUp').size == 0 }
  #end

  #### Lab
  # Log in with a valid user so the following test will pass
  #it 'should let a valid user log in' do
  #
  #
  #  expect(@page.current_url).to eq('http://m.888ladies.bingosys.net/client/index.aspx#/Lobby')
  #end


  ### Lab
  #
  # Create a test that also types in a value to the password field
  # and tries to login
  # Verify you get the same Bad Username or password text
  #it "should display invalid user or password error for invalid user" do
  #
  #end

  ### Lab
  #
  # Create a test that tries to type in only a password (deleting the username)
  # And verify you get the same Bad Username or password error
  #
  # Hint: Use input_username.clear to delete all text from the input field
  #
  #it "should display invalid user or password error for empty username and wrong password" do
  #
  #end

end

