Given("I am on the bbc sign in page") do
  @bbc_site = BbcSite.new
  @bbc_site.bbc_sign_in_page.visit_sign_in_page
  sleep 2
end

And("I click the link to register") do
  @bbc_site.bbc_sign_in_page.click_register_link
  sleep 2
end

When("I input a valid date of birth") do
  @bbc_site.bbc_register_page.enter_DOB('01','01','2000')
  @bbc_site.bbc_register_page.click_next_button
  sleep 2
end


And(/input an email and the password details (.*)/) do |password|
  @bbc_site.bbc_register_page.fill_in_email('christian_dacres@hotmail.co.uk')
  @bbc_site.bbc_register_page.fill_in_password(password)
  @bbc_site.bbc_register_page.password_field_tab
  sleep 2
end

Then(/I receive the corresponding error (.*)/) do |error|
  expect(@bbc_site.bbc_register_page.check_error_message).to eq error
end
