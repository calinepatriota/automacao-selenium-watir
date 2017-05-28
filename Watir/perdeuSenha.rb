require 'watir'
require 'test/unit'


class AE < Test::Unit::TestCase 

 def setup 
# @browser = Watir::Browser.new :firefox
 @browser = Watir::Browser.new :chrome
  #@browser = Watir::Browser.new :IE
  end



 def teardown
  ensure
      @browser.close
@browser.quit
  end

  
  def test_perdeuSenha
   @browser.goto 'http://192.168.0.35:3000/'
      @browser.link(:text, "Login").click
	 @browser.link(:text, "Perdeu a senha?").click
		   sleep(0005)
	  @browser.text_field(:css, "#user_email").clear
    @browser.text_field(:css, "#user_email").send_keys "testews@teste.com"
    @browser.button(:xpath, "//form[@id='formAuth']/button").click
	sleep(0030)
	assert @browser.element(:xpath=> ".//*[@id='formAuth']/p[2]").text.include? 'Você receberá um e-mail com instruções'
	end	
	end