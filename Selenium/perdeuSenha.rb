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
  
  def test_logarSucesso
	   @driver.get("http://192.168.0.35:3000/")
	  @driver.find_element(:xpath, "//a[contains(@href, '/users/sign_in')]").click
	  sleep(0010)
	  @driver.find_element(:xpath, "//form[@id='formAuth']/a").click
	   sleep(0005)
	  @driver.find_element(:css, "#user_email").clear
    @driver.find_element(:css, "#user_email").send_keys "testews@teste.com"
    @driver.find_element(:xpath, "//form[@id='formAuth']/button").click
	sleep(0030)
	assert @driver.find_element(:xpath, ".//*[@id='formAuth']/p[2]").text.include? 'Você receberá um e-mail com instruções'
  end
  end