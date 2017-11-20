require 'capybara'

class BbcHomePage
  include Capybara::DSL

  def visit_home_page
    visit('/')
  end

  def sign_in_link
    click_link('Sign in')
  end

  def click_sign_in_link
    sign_in_link.click
  end

end