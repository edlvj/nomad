require 'open-uri'

class ExpediaService
  
  def initialize(city, country)
    @city = city
    @contry = country
  end      

  def parse(lat, long)
    url = "https://www.expedia.com/lx/api/search?publishUIS=true&locale=en_US&location=#{URI::encode( @city.to_s ) }%2C+#{ URI::encode(@country.to_s) }&latLong=#{ lat }%2C#{ long }"
    result = JSON.parse(open(url).read) 
    return default_value if result.nil?
    excursion_array = []
    if result["activities"]
      for i in 0..2
        next if result["activities"][i].nil? 
        excursion_array.push({ title: result["activities"][i]["title"], price: result["activities"][i]["fromPrice"], url: "https://www.expedia.com/things-to-do/#{  result["activities"][i]["formattedTitle"]}"})
      end
    end  
    { data: excursion_array, url: "https://www.expedia.com/things-to-do/search?location=#{ @city }%2C+#{ @country }" }
  end
  
  private
  
  def default_value
    { data: [], url: 'https://www.expedia.com/Activities'}
  end
end