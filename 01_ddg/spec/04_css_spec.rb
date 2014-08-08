require 'spec_helper'

describe "DDG Goodies css" do

  it 'should select navigated item' do
    @page.navigate.to('https://duckduckgo.com/goodies#Entertainment')
    item = @page.find_element(:css, '#dl_Entertainment')
    expect(item.attribute('class')).to include('duck-selected')
  end

  it 'should mark all other items as not selected' do
    all = @page.find_elements(:css, 'a.ducklistduck')
    all.each do |item|
      if item.attribute(:id) == 'dl_Entertainment'
        expect(item.attribute(:class)).to include('duck-selected')
      else
        expect(item.attribute('class')).to include('duck-notselected')
      end
    end
  end

  it 'should change selected item after click' do
    music = @page.find_element(:id, 'dl_Music')
    music.click

    all = @page.find_elements(:css, 'a.ducklistduck')
    all.each do |item|
      if item.attribute(:id) == 'dl_Music'
        expect(item.attribute(:class)).to include('duck-selected')
      else
        expect(item.attribute('class')).to include('duck-notselected')
      end
    end
  end
end
