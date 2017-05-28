require "json"
require "selenium-webdriver"
gem "test-unit"
require "test/unit"


class AE < Test::Unit::TestCase 



  def setup
    #@driver = Selenium::WebDriver.for :firefox
	@driver = Selenium::WebDriver.for :chrome
	#@driver = Selenium::WebDriver.for :ie
	
  end
  
  def teardown
    @driver.quit
    
  end
  
def teste_addUsser
name = ("Teste" + rand(1...100).to_s)
nu = ("123" + rand(1...9999).to_s)
name2 = ("teste" + rand(1...100).to_s + "@.com")

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
		@driver.find_element(:css, "#user_name").send_keys name
		@driver.find_element(:css, "#user_profile_link").send_keys "teste.com.br"
			sleep(0002)
		@driver.find_element(:css, "#user_enrollment").send_keys nu
		@driver.find_element(:css, "#user_email").send_keys name2 
		@driver.find_element(:css, "#user_password").send_keys "Abcd@1234"
		@driver.find_element(:css, "#user_password_confirmation").send_keys "Abcd@1234"
		@driver.find_element(:xpath, "//form[@id='new_user']/section/div/div[5]/div/button").click
sleep(0002)
assert @driver.find_element(:css, "div.alert.alert-success").text.include? 'Usuário cadastrado com sucesso.'
 @driver.find_element(:css, "a.button.blue").click
 sleep(0002)
 @driver.find_element(:xpath, "//a[contains(@href, '/users/sign_in')]").click
	sleep(0002) 
	  @driver.find_element(:xpath, "//form[@id='formAuth']/div/input").clear
    @driver.find_element(:xpath, "//form[@id='formAuth']/div/input").send_keys nu
    @driver.find_element(:xpath, "//form[@id='formAuth']/div[2]/input").clear
    @driver.find_element(:xpath, "//form[@id='formAuth']/div[2]/input").send_keys "Abcd@1234"
    @driver.find_element(:xpath, "//form[@id='formAuth']/button").click 
	 sleep(0002)
	assert @driver.find_element(:css, "P").text.include? name
	end
	end