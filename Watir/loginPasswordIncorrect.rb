require 'watir'
require 'test/unit'


class AE < Test::Unit::TestCase 

 def setup 
 #@browser = Watir::Browser.new :firefox
 @browser = Watir::Browser.new :chrome
  #@browser = Watir::Browser.new :IE
  end



 def teardown
  ensure
      @browser.close
@browser.quit
  end
  
  	def test_logarSenhaIncorreta
	  @browser.goto 'http://192.168.0.35:3000/'
	 @browser.link(:text, "Login").click
	@browser.text_field(:id, "user_enrollment").clear
	@browser.text_field(:id, "user_enrollment").set("123456789")
	@browser.text_field(:id, "user_password").clear
	@browser.text_field(:id, "user_password").set("Abcd@123")
@browser.element(:css => "#formAuth > button:nth-child(9)").click
	sleep(0005)
	assert @browser.element(:css=> "p.alert").text.include? 'Matrícula ou senha inválidas.'
	
	end
	end