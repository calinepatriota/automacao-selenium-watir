require 'watir'
require 'test/unit'


class AE < Test::Unit::TestCase 


 def setup 
  #@browser = Watir::Browser.new :firefox
 @browser = Watir::Browser.new :chrome
  #@browser = Watir::Browser.new :ie
  end



 def teardown
  ensure
      @browser.close
@browser.quit
  end

def teste_updateNews
	name = ("Teste" + rand(1...100).to_s)

	@browser.goto 'http://192.168.0.35:3000/'
   @browser.link(:text, "Login").click
    @browser.text_field(:id, "user_enrollment").clear
    @browser.text_field(:id, "user_enrollment").set("123456789")
	@browser.text_field(:id, "user_password").clear
    @browser.text_field(:id, "user_password").set("Abcd@1234")
	@browser.element(:css => "#formAuth > button:nth-child(9)").click
   	  	@browser.element(:xpath => "html/body/div[2]/nav/ul/li[3]/a").click
sleep(0010)
@browser.element(:css, ".table > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1) > a:nth-child(1)").click
@browser.text_field(:css => "#article_title").clear
	@browser.text_field(:css => "#article_title").set(name)
	@browser.file_field(:css => "#article_image").set("C:\\Users\\caline\\Desktop\\IMG-20170410-WA0018 (1).jpg")
	@browser.button(:xpath => "//div[4]/div/button").click
	assert(true,"Noticia alterada com sucesso.")
	sleep(0005)
	@browser.link(:text, "Portal").click
 @browser.link(:text, "Notícias").click
 sleep(0005)
  @browser.element(:css, "h1.page-subtitle").click
 assert(true,"Testando UPDATE19")
 sleep(0002)
 assert @browser.element(:css, ".page-title3").text.include? name
	end
	end

	
	
	
	