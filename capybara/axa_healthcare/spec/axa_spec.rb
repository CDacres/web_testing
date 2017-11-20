require 'spec_helper'

describe 'axa get quote' do

  before(:all) do
    @driver = Capybara::Session.new(:chrome)
    @driver.visit('https://www.axappphealthcare.co.uk/')
  end

  it 'should find and click the get private quote button' do
    @driver.find(:link, 'Get a free quote for private health insurance').click
    @driver.switch_to_window(@driver.windows.last)
    expect(@driver.current_url).to eq('https://epmi.axappphealthcare.co.uk/PMIQuote/')
    @driver.fill_in('First name', :with => 'Fred')
    @driver.fill_in('Last name', :with => 'Bloggs')
  end

end
