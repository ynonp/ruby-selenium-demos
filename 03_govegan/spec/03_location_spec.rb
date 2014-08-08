require 'spec_helper'
require 'go_vegan'

describe 'Address Search Page' do
  before :all do
    @gv = GoVegan.new(@page)
  end

  it 'should display when entering the page' do
    @gv.dismiss_popup
    @gv.go_to_location_choose_page

    location = @page.find_element(:css, '.breadcrumbs .current.item')
    expect(location.text).to eq('שנה מקום')
    @gv.dismiss_popup
  end
end