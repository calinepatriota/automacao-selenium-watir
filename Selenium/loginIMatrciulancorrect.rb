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
  
 def test_logarMatriculaIncorreta
		@driver.get("http://192.168.0.35:3000/")
	  @driver.find_element(:xpath, "//a[contains(@href, '/users/sign_in')]").click
	  sleep(0005)
	  @driver.find_element(:xpath, "//form[@id='formAuth']/div/input").clear
    @driver.find_element(:xpath, "//form[@id='formAuth']/div/input").send_keys "1234567890"
    @driver.find_element(:xpath, "//form[@id='formAuth']/div[2]/input").clear
    @driver.find_element(:xpath, "//form[@id='formAuth']/div[2]/input").send_keys "Abcd@1234"
    @driver.find_element(:xpath, "//form[@id='formAuth']/button").click
	sleep(0002)
	assert @driver.find_element(:css, "p.alert").text.include? 'Matrícula ou senha inválidas.'
	end
	end