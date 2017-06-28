require 'nokogiri'
require 'open-uri'
   
class CouchsurfService
  
  def initialize(city)
    @city = city
  end  
  
  def parse(lat, long)
    return default_value if lat.nil? || long.nil?
    url = "https://www.couchsurfing.com/place?utf8=%E2%9C%93&search_query=#{URI::encode( @city ) }&latitude=#{ lat }&longitude=#{ long }"
    page = Nokogiri::HTML(open(url)) 
    cap = page.xpath('/html/body/main/div[2]/div[1]/div[1]/section/div/div[1]').text
    text = cap.match(/([\d,]+)/)
    return default_value if text.nil?
    { hosts: text.captures.first, url: url }
  end
  
  private
  
  def default_value
    {hosts: 0, url: 'https://www.couchsurfing.com'}
  end
end