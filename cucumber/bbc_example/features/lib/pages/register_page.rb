require 'capybara'

class BbcRegisterPage
  include Capybara::DSL

  def visit_register_page
    visit('/register')
  end

  def enter_DOB(day, month, year)
    fill_in('Day', with: day)
    fill_in('Month', with: month)
    fill_in('Year', with: year)
  end

  def click_next_button
    click_button('Next')
  end

  def fill_in_email(email)
    fill_in('Email', with: email)
  end

  def fill_in_password(password)
    fill_in('Password', with: password)
  end

  def password_field
    find_field('Password')
  end

  def password_field_tab
    password_field.send_keys(:tab)
  end

  def check_error_message
    find(:xpath, '//*[@id="form-message-password"]').text
  end

end
