require 'spec_helper'

describe 'bbc sign in error' do

  before(:all) do
    @bbc_site = BbcSite.new
  end

  it 'should display an error when using incorrect login details' do
    @bbc_site.homepage.visit_home_page
    @bbc_site.homepage.click_sign_in_link
    @bbc_site.signinpage.input_username('qwerty')
    @bbc_site.signinpage.input_password('test123')
    @bbc_site.signinpage.click_submit_button
    @bbc_site.signinpage.find('#form-message-password')
  end

end
