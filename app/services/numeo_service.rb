require 'nokogiri'
require 'open-uri'
   
class NumeoService
  def initialize(city)
    @city = city
  end
  
  def parse
    url = "https://www.numbeo.com/cost-of-living/in/#{URI::encode( @city) }?displayCurrency=EUR"
    page = Nokogiri::HTML(open(url)) 
    price = page.xpath('/html/body/div/table/tr[2]/td[2]').text
    return { price: 0, url: "https://www.numbeo.com/" } if price.empty?
    { price: price.to_i, url: url }
  end
end


