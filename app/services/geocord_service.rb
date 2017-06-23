require 'open-uri'

class GeocordService
  attr_accessor :lat, :lng
  
  def initialize(city)
    @city = city
    @lat, @lng = nil, nil
  end      

  def getCord
    result = JSON.parse(open("http://maps.googleapis.com/maps/api/geocode/json?address=#{ @city }").read) 
    if result["results"].any?
      @lat = result["results"][0]["geometry"]["location"]["lat"]
      @lng = result["results"][0]["geometry"]["location"]["lng"]
    end
    self
  end
end