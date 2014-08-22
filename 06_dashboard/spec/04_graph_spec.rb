require 'rspec'
require 'spec_helper'

describe 'Data Graph' do

  xdescribe 'Top Graph' do
    it 'should show correct stock data' do
    end

    it 'should show popup when hovering' do
    end

    it 'should change to new data when selecting a new stock' do
    end
  end

  describe 'Bottom Graph' do
    it 'should allow dragging the slider to change top graph' do
      @page.navigate.to "http://demo.componentone.com/ASPNET/StockPortfolio/Stocks"
      wait = Selenium::WebDriver::Wait.new(:timeout => 10 )
      wait.until { @page.find_elements(:css, '#stockHistory svg circle').size > 0 }

      handle = @page.find_elements(:css, '.ui-slider-handle').first
      range = @page.find_element(:css, '.ui-slider-range')
      old_size = range.size.width
      sleep 1
      @page.action.drag_and_drop_by(handle, 100, 0).perform
      new_size = range.size.width

      expect(new_size).to be < old_size
    end

    it 'should allow pressing arrows to change zoom range' do
    end

    it 'should not change zoom range beyond maximal' do
    end
  end
end