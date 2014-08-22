require 'rspec'
require 'spec_helper'

describe 'Top Menu' do

  before :all do
      @page.navigate.to("http://demo.componentone.com/ASPNET/StockPortfolio/Stocks")
  end


  it 'should have a desktop stocks link' do
  end

  it 'should have a mobile link' do

  end

  it 'should highlight hovered link' do
    wait = Selenium::WebDriver::Wait.new(:timeout => 10 )
    wait.until { @page.find_elements(:css, '#stockHistory svg circle').size > 0 }

    top_links = @page.find_elements(:css, ".wijmo-wijmenu-link")
    link = top_links.first

    @page.action.move_to(link).perform
    sleep 2
    class_list = link.attribute('class').split
    expect(class_list).to include('ui-state-hover')

  end
end