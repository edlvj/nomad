require 'nokogiri'
require 'open-uri'
   
class CouchsurfService
  
  def initialize(city)
    @city = city
  end  
  
  def parse
    @cord = GeocordService.new(@city).getCord
    return default_value if @cord.lat.nil?
    url = "https://www.couchsurfing.com/place?utf8=%E2%9C%93&search_query=#{URI::encode( @city ) }&latitude=#{ @cord.lat }&longitude=#{ @cord.lng }"
    page = Nokogiri::HTML(open(url)) 
    cap = page.xpath('/html/body/main/div[2]/div[1]/div[1]/section/div/div[1]').text
    text = cap.match(/([\d,]+)/)
    return default_value if text.nil?
    { hosts: text.captures.first.to_i, url: url }
  end
  
  private
  
  def default_value
    {hosts: 0, url: 'https://www.couchsurfing.com'}
  end
end