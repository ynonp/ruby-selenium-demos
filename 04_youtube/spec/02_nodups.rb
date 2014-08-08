require 'youtube'
require 'spec_helper'

describe "No duplicate movies in the recommended list" do
  before :all do
    @page.navigate.to 'http://m.youtube.com/watch?v=zxq4ziu-wrI'
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    @wait.until { @page.find_element(:css, 'ol._mp') }
  end

  it "should not contain any duplicate movies" do
    youtube = Youtube.new(@page)

    expect(youtube.all_movie_titles.size).to be > 0
    expect(youtube.all_moie_titles.size).to eq(youtube.movie_titles_no_dups.size)
  end


  it "should load more movies if load more is clicked" do
    youtube = Youtube.new(@page)

    size_before_click = youtube.all_movie_titles.size
    expect(size_before_click).to be > 0

    youtube.load_more

    size_after_click = youtube.all_movie_titles.size
    expect(size_after_click).to be > size_before_click
  end

  ###
  # Lab
  #
  # Fill in the missing test
  it "should have no duplicates after loading more movies" do
  end
end

