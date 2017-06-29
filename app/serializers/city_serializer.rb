class CitySerializer < ActiveModel::Serializer
  cache key: 'city', expires_in: 1.day 
  attributes :id, :title, :title_eng, :image, :traveler, :price, :excursions
  has_one :rating, serializer: RatingSerializer
  has_many :topic, serializer: ShortTopicSerializer
  
  def traveler
    { country: object.country.title,
      region: object.country.region.title,
      couchsurf: CouchsurfService.new(object.title_eng).parse(object.lat, object.long)
    }
  end
  
  def price
    { airbnb: AirbnbService.new(object.title_eng).parse(object.lat, object.long),
      meal: NumeoService.new(object.title_eng).parse,
      fin_req: object.country.fin_requirement ? object.country.fin_requirement.cost : 0
    }
  end  
  
  def excursions
    ExpediaService.new(object.title_eng, object.country.title_eng).parse(object.lat, object.long)
  end   
end