require 'spec_helper'

describe "DDG Themes" do

  before :all do
    @page.navigate.to('https://duckduckgo.com/')
  end

  let(:open_menu_btn)  { @page.find_element(:css, 'a.header__button--menu' ) }
  let(:close_menu_btn) { @page.find_element(:css, 'i.nav-menu__close') }
  let(:dark_theme_btn) { @page.find_element(:css, '.nav-menu__theme--d')}
  let(:default_theme_btn) { @page.find_element(:css, '.nav-menu__theme--default')}

  it 'show and hide right panel' do
    expect(dark_theme_btn.displayed?).not_to be_truthy

    open_menu_btn.click
    expect(dark_theme_btn.displayed?).to be_truthy

    close_menu_btn.click
    expect(dark_theme_btn.displayed?).not_to be_truthy
  end

  it 'should display at least two themes in the theme menu' do
    themes = @page.find_elements(:css, 'a.nav-menu__theme')
    expect(themes.size).to be >= 2
  end


  it 'should add style tags when changing a theme' do
    styles = @page.find_elements(:css, 'style')
    size_before = styles.size

    open_menu_btn.click
    dark_theme_btn.click
    styles = @page.find_elements(:css, 'style')
    size_after = styles.size

    expect(size_after).to be > size_before

  end

  it 'should add a .selected class when selecting a theme' do
    default_theme_btn.click
    # now default theme is selected
    expect(dark_theme_btn.attribute('class').split.include?('is-selected')).to be_falsey

    dark_theme_btn.click
    # now dark theme is selected
    expect(dark_theme_btn.attribute('class').split.include?('is-selected')).to be_truthy
  end

end
