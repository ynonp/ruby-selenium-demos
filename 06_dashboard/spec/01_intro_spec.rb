require 'rspec'
require 'spec_helper'

describe 'Dashboard Demo' do

  it 'should show correct page title' do
    @page.navigate.to("http://demo.componentone.com/ASPNET/StockPortfolio/Stocks")
    expect(@page.title).to eq("Stocks")
  end
end

describe 'Page Layout' do
  it 'should show a graph on the top left' do

  end

  it 'should show stock data on top right' do

  end

  it 'should show another graph in the next row' do

  end

  it 'should show a stocks table at the bottom' do

  end
end