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
		  def teste_updateUser
		name = ("Teste" + rand(1...100).to_s)
		
	 @driver.get("http://192.168.0.35:3000/")
 @driver.find_element(:xpath, "//a[contains(@href, '/users/sign_in')]").click
	  sleep(0005)
	  @driver.find_element(:xpath, "//form[@id='formAuth']/div/input").clear
    @driver.find_element(:xpath, "//form[@id='formAuth']/div/input").send_keys "123456789"
    @driver.find_element(:xpath, "//form[@id='formAuth']/div[2]/input").clear
    @driver.find_element(:xpath, "//form[@id='formAuth']/div[2]/input").send_keys "Abcd@1234"
    @driver.find_element(:xpath, "//form[@id='formAuth']/button").click
	sleep(0010)
	   	@driver.find_element(:xpath, "html/body/div[2]/nav/ul/li[6]/a").click
	sleep(0010)
@driver.find_element(:css, ".table > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1) > a:nth-child(2)").click

	sleep(0005)
@driver.find_element(:css, "#user_profile_role").send_keys name

		@driver.find_element(:css, ".btn-warning").click
	sleep(0002)
	assert @driver.find_element(:css, "div.alert.alert-success").text.include? 'Usuário alterado com sucesso.'
	@driver.find_element(:css, "a.button:nth-child(3)").click
	
	end
	end