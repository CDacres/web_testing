require_relative '../lib/pages/home_page'
require_relative '../lib/pages/sign_in_page'
require_relative '../lib/pages/register_page'

class BbcSite

  def bbc_homepage
    BbcHomePage.new
  end

  def bbc_sign_in_page
    BbcSignInPage.new
  end

  def bbc_register_page
    BbcRegisterPage.new
  end

end
