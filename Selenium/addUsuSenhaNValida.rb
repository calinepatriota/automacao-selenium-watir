require "json"
require "selenium-webdriver"
gem "test-unit"
require "test/unit"


class AE < Test::Unit::TestCase 
  def setup
   # @driver = Selenium::WebDriver.for :firefox
	@driver = Selenium::WebDriver.for :chrome
	#@driver = Selenium::WebDriver.for :ie
  end
  
  def teardown
    @driver.quit
    
  end
  
def teste_addUsser
 @driver.get("http://192.168.0.35:3000/")
  @driver.find_element(:xpath, "//a[contains(@href, '/users/sign_in')]").click
	  sleep(0005)
	  @driver.find_element(:xpath, "//form[@id='formAuth']/div/input").clear
    @driver.find_element(:xpath, "//form[@id='formAuth']/div/input").send_keys "123456789"
    @driver.find_element(:xpath, "//form[@id='formAuth']/div[2]/input").clear
    @driver.find_element(:xpath, "//form[@id='formAuth']/div[2]/input").send_keys "Abcd@1234"
    @driver.find_element(:xpath, "//form[@id='formAuth']/button").click    
	sleep(0005)

 @driver.get("http://192.168.0.35:3000/dashboard/users/new")
		@driver.find_element(:css, "#user_name").send_keys "A7"
		@driver.find_element(:css, "#user_profile_link").send_keys "teste.com.br"
		@driver.find_element(:css, "#user_enrollment").send_keys "1233210890211"
		@driver.find_element(:css, "#user_email").send_keys "teste908@teste.com"
		@driver.find_element(:css, "#user_password").send_keys "abc"
		@driver.find_element(:css, "#user_password_confirmation").send_keys "abc"
		
 @driver.find_element(:xpath, "//form[@id='new_user']/section/div/div[5]/div/button").click
sleep(0002)
assert @driver.find_element(:xpath, ".//*[@id='alert-error']/ul/li[1]").text.include? 'Senha deve conter pelo menos um digito, uma em maiusculo e um caracter especial'
assert @driver.find_element(:xpath, ".//*[@id='alert-error']/ul/li[2]").text.include? 'Senha é muito curta(o) (mínimo: 6 caracteres)'

	end
	end