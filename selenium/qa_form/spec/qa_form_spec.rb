require 'spec_helper'
require 'pry'

describe 'qa form' do

  before(:all) do
    @driver = Selenium::WebDriver.for :chrome
  end

  it 'should open the qa form page' do
    @driver.get('http://toolsqa.com/automation-practice-form/')
    expect(@driver.current_url).to eq('http://toolsqa.com/automation-practice-form/')
    expect(@driver.find_element(:name, 'firstname').displayed?).to eq true
    # binding.pry
    # sleep 3
  end

  it 'should have a valid partial link test' do
    expect(@driver.find_element(:link, 'Partial Link Test').displayed?).to eq true
    expect(@driver.find_element(:link, 'Partial Link Test').attribute("href")).to eq('http://toolsqa.wpengine.com/automation-practice-form/')
  end

  it 'should have a valid link test' do
    expect(@driver.find_element(:link, 'Link Test').displayed?).to eq true
    expect(@driver.find_element(:link, 'Link Test').attribute("href")).to eq('http://toolsqa.wpengine.com/automation-practice-table/')
    @driver.find_element(:link, 'Link Test').click
    expect(@driver.current_url).to eq('http://toolsqa.com/automation-practice-table/')
    expect(@driver.find_element(:class, 'tsc_table_s13').displayed?).to eq true
    @driver.navigate().back()
  end

  it 'should fill in the first name field' do
    expect(@driver.find_element(:name, 'firstname').displayed?).to eq true
    @driver.find_element(:name, 'firstname').send_keys('Christian')
    expect(@driver.find_element(:name, 'firstname')['value']).to eq('Christian')
  end

  it 'should fill in the last name field' do
    expect(@driver.find_element(:name, 'lastname').displayed?).to eq true
    @driver.find_element(:name, 'lastname').send_keys('Dacres')
    expect(@driver.find_element(:name, 'lastname')['value']).to eq('Dacres')
  end

  it 'should click on the male radio button' do
    expect(@driver.find_element(:id, 'sex-0').displayed?).to eq true
    @driver.find_element(:id, 'sex-0').click
    expect(@driver.find_element(:id, 'sex-0').selected?).to eq true
  end

  it 'should click on the female radio button' do
    expect(@driver.find_element(:id, 'sex-1').displayed?).to eq true
    @driver.find_element(:id, 'sex-1').click
    expect(@driver.find_element(:id, 'sex-1').selected?).to eq true
  end

  it 'should click on the years of experience radio buttons' do
    expect(@driver.find_element(:id, 'exp-0').displayed?).to eq true
    @driver.find_element(:id, 'exp-0').click
    expect(@driver.find_element(:id, 'exp-0').selected?).to eq true
    expect(@driver.find_element(:id, 'exp-1').displayed?).to eq true
    @driver.find_element(:id, 'exp-1').click
    expect(@driver.find_element(:id, 'exp-1').selected?).to eq true
    expect(@driver.find_element(:id, 'exp-2').displayed?).to eq true
    @driver.find_element(:id, 'exp-2').click
    expect(@driver.find_element(:id, 'exp-2').selected?).to eq true
    expect(@driver.find_element(:id, 'exp-3').displayed?).to eq true
    @driver.find_element(:id, 'exp-3').click
    expect(@driver.find_element(:id, 'exp-3').selected?).to eq true
    expect(@driver.find_element(:id, 'exp-4').displayed?).to eq true
    @driver.find_element(:id, 'exp-4').click
    expect(@driver.find_element(:id, 'exp-4').selected?).to eq true
    expect(@driver.find_element(:id, 'exp-5').displayed?).to eq true
    @driver.find_element(:id, 'exp-5').click
    expect(@driver.find_element(:id, 'exp-5').selected?).to eq true
    expect(@driver.find_element(:id, 'exp-6').displayed?).to eq true
    @driver.find_element(:id, 'exp-6').click
    expect(@driver.find_element(:id, 'exp-6').selected?).to eq true

  end

  it 'should fill in the date field' do
    expect(@driver.find_element(:id, 'datepicker').displayed?).to eq true
    @driver.find_element(:id, 'datepicker').send_keys('25/10/17')
    expect(@driver.find_element(:id, 'datepicker')['value']).to eq('25/10/17')
  end

  it 'should click on the profession radio button' do
    expect(@driver.find_element(:id, 'profession-0').displayed?).to eq true
    @driver.find_element(:id, 'profession-0').click
    expect(@driver.find_element(:id, 'profession-0').selected?).to eq true
    expect(@driver.find_element(:id, 'profession-1').displayed?).to eq true
    @driver.find_element(:id, 'profession-1').click
    expect(@driver.find_element(:id, 'profession-1').selected?).to eq true
  end

  it 'should upload a test file' do
    @driver.find_element(id: 'photo').send_keys('/Users/tech-a68/SDET11/web_testing/selenium/qa_form/test.txt')
    # # find_element below doesn't work, can't find file name text
    # upload = @driver.find_element(:value, 'test.txt').text
    # expect(upload).to eq('test.txt')
  end

  it 'should click on the automation tool radio button' do
    expect(@driver.find_element(:id, 'tool-0').displayed?).to eq true
    @driver.find_element(:id, 'tool-0').click
    expect(@driver.find_element(:id, 'tool-0').selected?).to eq true
    expect(@driver.find_element(:id, 'tool-1').displayed?).to eq true
    @driver.find_element(:id, 'tool-1').click
    expect(@driver.find_element(:id, 'tool-1').selected?).to eq true
    expect(@driver.find_element(:id, 'tool-2').displayed?).to eq true
    @driver.find_element(:id, 'tool-2').click
    expect(@driver.find_element(:id, 'tool-2').selected?).to eq true
  end

  it 'should have clickable framework link' do
    expect(@driver.find_element(:link, 'Selenium Automation Hybrid Framework').displayed?).to eq true
  end

  it 'should have clickable test file download link' do
    expect(@driver.find_element(:link, 'Test File to Download').displayed?).to eq true
  end

  it 'should find the continents dropdown' do
    expect(@driver.find_element(:id, 'continents').displayed?).to eq true
  end

  it 'should select each option from the continents dropdown' do
    dropdown = @driver.find_element(id: 'continents')
    select_list = Selenium::WebDriver::Support::Select.new(dropdown)
    select_list.select_by(:text, 'Asia')
    expect(select_list.selected_options[0].text).to eq('Asia')

    select_list.select_by(:text, 'Europe')
    expect(select_list.selected_options[0].text).to eq('Europe')

    select_list.select_by(:text, 'Africa')
    expect(select_list.selected_options[0].text).to eq('Africa')

    select_list.select_by(:text, 'Australia')
    expect(select_list.selected_options[0].text).to eq('Australia')

    select_list.select_by(:text, 'South America')
    expect(select_list.selected_options[0].text).to eq('South America')

    select_list.select_by(:text, 'North America')
    expect(select_list.selected_options[0].text).to eq('North America')

    select_list.select_by(:text, 'Antartica')
    expect(select_list.selected_options[0].text).to eq('Antartica')
  end

  it 'should find the Selenium Commands list' do
    expect(@driver.find_element(:id, 'selenium_commands').displayed?).to eq true
  end

  it 'should select each option from the Selenium Commands dropdown' do
    dropdown = @driver.find_element(id: 'selenium_commands')
    select_list = Selenium::WebDriver::Support::Select.new(dropdown)
    select_list.select_by(:text, 'Browser Commands')
    expect(select_list.selected_options[0].text).to eq('Browser Commands')
    select_list.deselect_by(:text, 'Browser Commands')

    select_list.select_by(:text, 'Navigation Commands')
    expect(select_list.selected_options[0].text).to eq('Navigation Commands')
    select_list.deselect_by(:text, 'Navigation Commands')

    select_list.select_by(:text, 'Switch Commands')
    expect(select_list.selected_options[0].text).to eq('Switch Commands')
    select_list.deselect_by(:text, 'Switch Commands')

    select_list.select_by(:text, 'Wait Commands')
    expect(select_list.selected_options[0].text).to eq('Wait Commands')
    select_list.deselect_by(:text, 'Wait Commands')

    select_list.select_by(:text, 'WebElement Commands')
    expect(select_list.selected_options[0].text).to eq('WebElement Commands')
    select_list.deselect_by(:text, 'WebElement Commands')
  end

  it 'should click the submit button and clear all fields' do
    expect(@driver.find_element(:id, 'submit').displayed?).to eq true
    @driver.find_element(:id, 'submit').click
    expect(@driver.find_element(:name, 'firstname')['value']).to eq('')
    expect(@driver.find_element(:name, 'lastname')['value']).to eq('')
    expect(@driver.find_element(:id, 'datepicker')['value']).to eq('')
  end

  it 'should print out all strong tags' do
    @driver.find_elements(:css, 'strong').each do |i|
      puts i.text
    end
  end

  it 'should check for partial link text with xpath' do
    expect(@driver.find_element(:xpath, '//*[@id="content"]/form/fieldset/div[1]/a[1]/strong').displayed?).to eq true
  end

end
