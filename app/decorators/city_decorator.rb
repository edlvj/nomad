class CityDecorator < Drape::Decorator
  delegate_all
  
  def price
    airbnb = AirbnbService.new(title_eng).parse(lat, long) 
    meal = NumeoService.new(title_eng).parse
    fin_req = object.country.fin_requirement ? object.country.fin_requirement.cost : 0
    
    Hash.new(airbnb: airbnb, meal: meal, fin_req: fin_req)
  end      
  
  def traveler
    couchsurf = CouchsurfService.new(object.title_eng).parse(object.lat, object.long)
    Hash.new(country: object.country.title, region: object.country.region.title, couchsurf: couchsurf)
  end  
  
  def excursions
    expedia = ExpediaService.new(object.title_eng, object.country.title_eng).parse(object.lat, object.long)
    expedia
  end  
end