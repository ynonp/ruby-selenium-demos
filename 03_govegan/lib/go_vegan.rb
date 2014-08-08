class GoVegan
  def initialize(page)
    @page = page
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

    @page.navigate.to('http://go-vegan.co.il')
    @page.find_element(:id, 'pick1').click
  end

  def go_to_location_choose_page
    @page.find_element(:css, '.navicon-menubutton').click
    @page.find_element(:css, '.icon-switch-location').click
  end

  def dismiss_popup
    ok_btn = @page.find_element(:id, 'ok-btn')
    @wait.until { ok_btn.displayed? }
    ok_btn.click
  end


end