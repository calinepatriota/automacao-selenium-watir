require 'watir'
require 'test/unit'


class AE < Test::Unit::TestCase 

 def setup 
 # @browser = Watir::Browser.new :firefox
 @browser = Watir::Browser.new :chrome
  #@browser = Watir::Browser.new :ie
  end



 def teardown
  ensure
      @browser.close
@browser.quit
  end
  
def teste_updateUser
name = ("Teste" + rand(1...100).to_s)

	@browser.goto 'http://192.168.0.35:3000/'
   @browser.link(:text, "Login").click
   @browser.text_field(:id, "user_enrollment").clear
    @browser.text_field(:id, "user_enrollment").set("123456789")
	@browser.text_field(:id, "user_password").clear
    @browser.text_field(:id, "user_password").set("Abcd@1234")
	@browser.element(:css => "#formAuth > button:nth-child(9)").click
   	@browser.element(:css => ".col-xs-2 > nav:nth-child(1) > ul:nth-child(1) > li:nth-child(6) > a:nth-child(1)").click
	@browser.element(:css => ".table > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1) > a:nth-child(2)").click
	@browser.text_field(:css => "#user_profile_role").set(name)
		@browser.element(:css => ".btn-warning").click
	 assert @browser.element(:css, "div.alert.alert-success").text.include? 'Usuário alterado com sucesso.'
	@browser.element(:css => "a.button:nth-child(3)").click
	
	end
	end