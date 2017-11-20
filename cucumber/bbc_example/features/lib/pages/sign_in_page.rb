require 'capybara'

class BbcSignInPage
  include Capybara::DSL

  attr_accessor :login_error_text, :password_error_text

  def initialize
    @login_error_text = "Sorry, we can’t find an account with that username. If you're over 13, try your email address instead or get help here."
    @password_error_text = "Uh oh, that password doesn’t match that account. Please try again."
  end

  USERNAME_FIELD_ID ||= 'user-identifier-input'
  PASSWORD_FIELD_ID ||= 'password-input'
  WRONG_PASSWORD_ERROR_ID ||= 'form-message-username'
  REGISTER_LINK_TEXT ||= 'Register now'
  SUBMIT_BUTTON_ID ||= 'submit-button'
  LOGIN_ERROR_MESSAGE_CSS ||= 'p.form-message__text'
  PASSWORD_ERROR_MESSAGE_ID ||= 'form-message-password'

  def visit_sign_in_page
    visit('/signin')
  end

  def click_register_link
    click_link('Register now')
  end

  def username_field
    find_field(:id, USERNAME_FIELD_ID).visible?
  end

  def input_to_username_field(username)
    fill_in(USERNAME_FIELD_ID, with: username)
  end

  def password_field
    find_field(:id, PASSWORD_FIELD_ID).visible?
  end

  def input_to_password_field(password)
    fill_in(PASSWORD_FIELD_ID, with: password)
  end

  def sign_in_button
    find_button(SUBMIT_BUTTON_ID)
  end

  def click_sign_in_button
    sign_in_button.click
  end

  def get_error_message_text
    find(:css, LOGIN_ERROR_MESSAGE_CSS).text
  end

  def get_password_error_message_text
    find(:id, PASSWORD_ERROR_MESSAGE_ID).text
  end

end
