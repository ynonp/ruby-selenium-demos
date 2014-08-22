require 'rspec'
require 'spec_helper'

describe 'Dashboard Demo' do

  it 'should show correct page title' do
    @page.navigate.to("http://demo.componentone.com/ASPNET/StockPortfolio/Stocks")
    expect(@page.title).to eq("Stocks")
  end
end

describe 'Page Layout' do
  before :all do
    @page.navigate.to("http://demo.componentone.com/ASPNET/StockPortfolio/Stocks")
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  end

  it 'should show a graph on the top left' do
    graph = @page.find_element(:css, '#stockHistory')
    expect(graph.displayed?).to be_truthy
  end

  it 'should display stock graph as SVG with circles' do
    @wait.until { @page.find_elements(:css, '#stockHistory svg circle').size > 0 }
    points = @page.find_elements(:css, '#stockHistory svg circle')
    expect(points.size).to be > 0
  end

  it 'should show stock data on top right' do

  end

  it 'should show another graph in the next row' do

  end

  it 'should show a stocks table at the bottom' do

  end
end