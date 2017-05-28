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
	
def teste_updateNews
	name = ("Teste" + rand(1...100).to_s)
	
	
 @driver.get("http://192.168.0.35:3000/")

	  @driver.find_element(:xpath, "//a[contains(@href, '/users/sign_in')]").click
	  sleep(0002)
	  @driver.find_element(:xpath, "//form[@id='formAuth']/div/input").clear
    @driver.find_element(:xpath, "//form[@id='formAuth']/div/input").send_keys "123456789"
    @driver.find_element(:xpath, "//form[@id='formAuth']/div[2]/input").clear
    @driver.find_element(:xpath, "//form[@id='formAuth']/div[2]/input").send_keys "Abcd@1234"
    @driver.find_element(:xpath, "//form[@id='formAuth']/button").click
sleep(0005)
@driver.find_element(:xpath, "html/body/div[2]/nav/ul/li[3]/a").click
sleep(0002)
@driver.find_element(:css, ".table > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1) > a:nth-child(1)").click
	sleep(0002)
	@driver.find_element(:id, "article_title").clear
 @driver.find_element(:id, "article_title").send_keys (name)
 @driver.find_element(:css, "#article_image").send_keys ("C:\\Users\\caline\\Desktop\\IMG-20170410-WA0018 (1).jpg")
@driver.find_element(:xpath, "//div[4]/div/button").click
    assert(true,"Noticia alterada com sucesso.")
		sleep(0002)
	@driver.find_element(:link_text, "Portal").click
	sleep(0002)
  @driver.find_element(:xpath, "(//a[contains(@href, '/articles')])[2]").click
  sleep(0002)
   @driver.find_element(:css, "h1.page-subtitle").click
 sleep(0002)
 assert @driver.find_element(:css, ".page-title3").text.include? name
	
	end
end
	