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
  
def teste_delUser
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
sleep(0002)
 @driver.find_element(:xpath, "//td[4]/a").click
    assert(true,"Usuário removido com sucesso.")
 @driver.find_element(:css, "a.button.blue").click


	end
	end