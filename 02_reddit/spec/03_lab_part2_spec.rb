require 'spec_helper'

describe 'Reddit voting' do

  it 'should not allow guest to vote' do
    # Lab 1
    #
    # A user must be logged in to upvote a story on reddit.
    # Verify that not logged in users can't upvote, and get a login dialog
    # when trying
    @page.navigate.to('http://www.reddit.com/r/ProgrammerHumor/')
    vote_button = @page.find_element(:css, '.arrow.up')
    vote_button.click

    # Verify item was not upvotted

    # Verify login dialog appeared
  end

  it 'should allow upvoting for logged in users' do
    # Lab 2
    #
    # Now register an account and try to login with your credentials
    # before upvoting
    # Verify you can now upvote a story
  end
end