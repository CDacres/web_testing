Given("I am on the sign in page") do
  @bbcsite = BbcSite.new
  @bbcsite.bbc_sign_in_page.visit_sign_in_page
end

When("I input invalid login credentials") do
  @bbcsite.bbc_sign_in_page.input_to_username_field('test-username')
  @bbcsite.bbc_sign_in_page.input_to_password_field('test-password')
end

And("I click login") do
  @bbcsite.bbc_sign_in_page.click_sign_in_button
end

Then("I receive a valid error") do
  expect(@bbcsite.bbc_sign_in_page.get_error_message_text).to eq @bbcsite.bbc_sign_in_page.login_error_text
end

When("I input a valid username") do
  @bbcsite.bbc_sign_in_page.input_to_username_field('christian_dacres@hotmail.co.uk')
end

And("I input an invalid password") do
  @bbcsite.bbc_sign_in_page.input_to_password_field('test-password')
end

Then("I receive a valid password error") do
  expect(@bbcsite.bbc_sign_in_page.get_password_error_message_text).to eq @bbcsite.bbc_sign_in_page.password_error_text
end
