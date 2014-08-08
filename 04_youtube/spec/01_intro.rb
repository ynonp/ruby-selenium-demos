require 'spec_helper'

describe "Youtube Video Page" do
  before :all do
    @page.navigate.to 'http://m.youtube.com/watch?v=zxq4ziu-wrI'
  end

  it "Should not allow unsigned users to like a video" do
    like = @page.find_element(:css, '._mt._mu')
    lightbox = @page.find_element(:css, '#lightbox')

    like.click

    expect(lightbox.displayed?).to be_true
  end

  ###
  # Lab
  #
  # Unlike a video button is identified by the CSS selector:
  # ._mt._mx
  #
  # Write a test that verifies unsigned users get the popup
  # when trying to unlike a video
  it "Should not allow unsigned users to unlike a video" do
  end

end

