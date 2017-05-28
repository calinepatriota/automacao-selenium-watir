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
		@browser.text_field(:css => "#user_enrollment").set("1233210890211")
		@browser.text_field(:css => "#user_email").set("teste908@teste.com")
		@browser.text_field(:css => "#user_password").set("abc")
		@browser.text_field(:css => "#user_password_confirmation").set("abc")
		@browser.element(:css => ".btn-warning").click
	assert @browser.element(:xpath=> ".//*[@id='alert-error']/ul/li[1]").text.include? 'Senha deve conter pelo menos um digito, uma em maiusculo e um caracter especial'
assert @browser.element(:xpath=> ".//*[@id='alert-error']/ul/li[2]").text.include? 'Senha é muito curta(o) (mínimo: 6 caracteres)'
	
	end
	end