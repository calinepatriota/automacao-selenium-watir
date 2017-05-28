
require 'watir'
require 'test/unit'


class AE < Test::Unit::TestCase 

 def setup 
  #@browser = Watir::Browser.new :firefox
 @browser = Watir::Browser.new :chrome
  #@browser = Watir::Browser.new :ie
  end



 def teardown
  ensure
      @browser.close
@browser.quit
  end


def teste_deleteUser
	@browser.goto 'http://192.168.0.35:3000/'
   @browser.link(:text, "Login").click
   @browser.text_field(:id, "user_enrollment").clear
    @browser.text_field(:id, "user_enrollment").set("123456789")
	@browser.text_field(:id, "user_password").clear
    @browser.text_field(:id, "user_password").set("Abcd@1234")
	@browser.element(:css => "#formAuth > button:nth-child(9)").click
     	@browser.element(:xpath => "html/body/div[2]/nav/ul/li[6]/a").click
sleep(0010)
	@browser.element(:xpath => "//td[4]/a").click
    assert(true,"Usuário removido com sucesso.")
	@browser.element(:css => "a.button:nth-child(3)").click
	end
	end