class CitySerializer < ActiveModel::Serializer
  attributes :id, :title, :title_eng, :image, :traveler, :price
  has_one :rating, serializer: RatingSerializer
  has_many :topic, serializer: ShortTopicSerializer
  
  def traveler
    { country: object.country.title,
      region: object.country.region.title,
      couchsurf: CouchsurfService.new(object.title_eng).parse
    }
  end
  
  def price
    { airbnb: AirbnbService.new(object.title_eng).parse,
      meal: NumeoService.new(object.title_eng).parse,
      fin_req: object.country.fin_requirement ? object.country.fin_requirement.cost : 0
    }
  end  
end