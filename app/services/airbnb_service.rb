require 'nokogiri'
require 'open-uri'
   
class AirbnbService
  def initialize(city)
    @city = city
  end
  
  def parse
    @cord = GeocordService.new(@city).getCord
    return { price: 0, url: 'https://ru.airbnb.com'} if @cord.lat.nil?
    url = "https://ru.airbnb.com/api/v2/explore_tabs?version=1.1.3&is_guest_from_sem_traffic=false&location=#{ URI::encode(@city) }&sw_lat=#{ @cord.lat }&sw_lng=#{ @cord.lng }&&currency=UAH&locale=ru&key=d306zoyjsyarp7ifhu67rjxn52tv0t20"
    result = JSON.parse(open(url, "User-Agent" => "Chrome/15.0.854.0").read)
    price = result["explore_tabs"][0]["home_tab_metadata"]["price_histogram"]["average_price"]
    { price: price, url: "https://ru.airbnb.com/s/#{ @city }"}
  end
end