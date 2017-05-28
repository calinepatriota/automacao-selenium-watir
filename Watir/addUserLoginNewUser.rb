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
  
  def teste_addUsser
  name = ("Teste" + rand(1...100).to_s)
nu = ("123" + rand(1...9999).to_s)
name2 = ("teste" + rand(1...100).to_s + "@.com")
  
	@browser.goto 'http://192.168.0.35:3000/'
	@browser.link(:text, "Login").click
   @browser.text_field(:id, "user_enrollment").clear
    @browser.text_field(:id, "user_enrollment").set("123456789")
	@browser.text_field(:id, "user_password").clear
    @browser.text_field(:id, "user_password").set("Abcd@1234")
	@browser.element(:css => "#formAuth > button:nth-child(9)").click
		sleep(0010)
		@browser.goto 'http://192.168.0.35:3000/dashboard/users/new'
		@browser.text_field(:css => "#user_name").set(name)
		@browser.text_field(:css => "#user_profile_link").set("teste.com.br")
		@browser.text_field(:css => "#user_enrollment").set(nu)
		@browser.text_field(:css => "#user_email").set(name2)
		@browser.text_field(:css => "#user_password").set("Abcd@1234")
		@browser.text_field(:css => "#user_password_confirmation").set("Abcd@1234")
		@browser.element(:css => ".btn-warning").click
 assert @browser.element(:css, "div.alert.alert-success").text.include? 'Usuário cadastrado com sucesso.'
 @browser.element(:css => "a.button:nth-child(3)").click
	 @browser.link(:text, "Login").click
    @browser.text_field(:id, "user_enrollment").set(nu)
    @browser.text_field(:id, "user_password").set("Abcd@1234")
	@browser.element(:css => "#formAuth > button:nth-child(9)").click
	sleep(0002)
	assert @browser.element(:css, "P").text.include? name
	
	
	end
	end