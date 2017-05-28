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
  
  def teste_addUsserMatJaExiste
	@browser.goto 'http://192.168.0.35:3000/'
	@browser.link(:text, "Login").click
   @browser.text_field(:id, "user_enrollment").clear
    @browser.text_field(:id, "user_enrollment").set("123456789")
	@browser.text_field(:id, "user_password").clear
    @browser.text_field(:id, "user_password").set("Abcd@1234")
	@browser.element(:css => "#formAuth > button:nth-child(9)").click
		sleep(0010)
		@browser.goto 'http://192.168.0.35:3000/dashboard/users/new'
		@browser.text_field(:css => "#user_name").set("A7")
		@browser.text_field(:css => "#user_profile_link").set("teste.com.br")
		@browser.text_field(:css => "#user_enrollment").set("12345678954")
		@browser.text_field(:css => "#user_email").set("testews@teste.com")
		@browser.text_field(:css => "#user_password").set("Abcd@1234")
		@browser.text_field(:css => "#user_password_confirmation").set("Abcd@1234")
		@browser.element(:css => ".btn-warning").click
		assert @browser.element(:xpath=> ".//*[@id='alert-error']/ul/li").text.include? 'Email já está em uso'
	
	
	end
	end