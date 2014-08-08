class Youtube

  def initialize(page)
    @page = page
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  end

  def load_more
    load_more_button = @page.find_element(:css, '._map button')

    size_before_click = all_movie_titles.size
    2.times { load_more_button.click }

    @wait.until { all_movie_titles.size > size_before_click }
  end

  def all_movie_titles
    @page.find_elements(:css, 'ol._mp li h4._mtg')
  end

  def movie_titles_no_dups
    titles = movie_titles_array()
    hash = {}

    titles.each do |item|
      hash[item.text] += 1
    end

    return hash.keys
  end


end
